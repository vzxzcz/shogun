/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2011 Sergey Lisitsyn
 * Copyright (C) 2011 Berlin Institute of Technology and Max-Planck-Society
 */

#ifndef GNB_H_
#define GNB_H_

#include "Classifier.h"
#include "features/DotFeatures.h"

namespace shogun {

/** @brief Class GNB, a Gaussian Naive Bayes classifier
 *
 *	Formally, chooses class c with maximum \f$ P(c)P(x|c) \f$
 *	probability. Naive bayes assumes \f$ P(x|c) \f$ as product
 *  \f$ \prod_i P(x_i|c) \f$ and gaussian naive bayes make assume of
 *  \f$P(x_i|c) \sim \mathcal{N} (\mu_{i,c}, {\sigma}^2_{i,c})\f$, where \f$ \mathcal{N} \f$ is
 *  normal distribution and \f$ \mu_{i,c}, {\sigma}^2_{i,c} \f$ are estimates of i-th
 *  feature mean and variance among class \f$ c \f$.
 *
 *  Note that classifier requires ~ (dimensionality)*(number of classes)
 *  memory.
 *
 */

class CGNB : public CClassifier
{
public:
	/** default constructor
	 *
	 */
	CGNB();

	/** constructor
	 * 	@param train_examples train examples
	 *	@param train_labels labels corresponding to train_examples
	 */
	CGNB(CFeatures* train_examples, CLabels* train_labels);

	/** destructor
	 *
	 */
	virtual ~CGNB();

	/** set features for classify
	 *
	 */
	virtual inline void set_features(CDotFeatures* feat)
	{
		 SG_UNREF(m_features);
		 SG_REF(feat);
		 m_features = feat;
	}

	/** get features for classify
	 *
	 */
	virtual inline CDotFeatures* get_features()
	{
		SG_REF(m_features);
		return m_features;
	}

	/** train classifier
	 * 	@param data train examples
	 * 	@return true if successful
	 */
	virtual bool train(CFeatures* data = NULL);

	/** classify all examples
	 *  @return labels
	 */
	virtual CLabels* classify();

	/** classify specified examples
	 * 	@param data examples to be classified
	 * 	@return labels corresponding to data
	 */
	virtual CLabels* classify(CFeatures* data);

	/** classifiy specified example
	 * 	@param idx example index
	 * 	@return label
	 */
	virtual float64_t classify_example(int32_t idx);

	/**
	 * 	@return classifier name
	 */
	virtual inline const char* get_name() const { return "Gaussian Naive Bayes"; };

	/**
	 * 	@return classifier type
	 */
	virtual inline EClassifierType get_classifier_type() { return CT_GNB; };

protected:

	/// features for training or classifying
	CDotFeatures* m_features;

	/// minimal label
	int32_t m_min_label;

	/// actual int labels
	int32_t* m_labels;

	/// number of train labels
	int32_t m_num_train_labels;

	/// number of different classes (labels)
	int32_t m_num_classes;

	/// dimensionality of feature space
	int32_t m_dim;

	/// means for normal distributions of features
	float64_t* m_means;

	/// variances for normal distributions of features
	float64_t* m_variances;

	/// a priori probabilities of labels
	float64_t* m_label_prob;

private:

	/** computes gaussian exponent by x, indexes, m_means and m_variances
	 * @param x feature value
	 * @param l_idx index of label
	 * @param f_idx index of feature
	 * @return exponent value
	 */
	float64_t inline normal_exp(float64_t x, int32_t l_idx, int32_t f_idx)
	{
		return CMath::exp(-CMath::pow((x-m_means[m_dim*l_idx+f_idx]),2)/(2*m_variances[m_dim*l_idx+f_idx]));
	}

	/// label rates
	float64_t* m_rates;

	/// current feature vector
	float64_t* m_feat_vec;
};

}

#endif /* GNB_H_ */
