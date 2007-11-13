name = 'GaussianShift'
shift_step = 1
width_ = 1.3
km_train = [1.28387434, 0.69997109, 0.622209948, 0.693682011, 0.521882408, 0.335676053, 0.724662538, 0.39856823, 0.367959427, 0.655917434, 0.496077335;0.69997109, 1.44321411, 0.489186343, 0.845980337, 0.563237355, 0.619439323, 0.676483458, 0.75171916, 0.522215246, 0.812422687, 0.796094165;0.622209948, 0.489186343, 1.30558034, 0.635044722, 0.591560806, 0.354750298, 0.88383247, 0.523879626, 0.59913347, 0.437181045, 0.522576361;0.693682011, 0.845980337, 0.635044722, 1.31317868, 0.647010211, 0.499736377, 0.73337166, 0.465360449, 0.581799329, 0.705770897, 0.514365709;0.521882408, 0.563237355, 0.591560806, 0.647010211, 1.14682922, 0.693218872, 0.883893522, 0.551185976, 0.718706321, 0.485222123, 0.461727899;0.335676053, 0.619439323, 0.354750298, 0.499736377, 0.693218872, 1.47914498, 0.834207343, 0.780964437, 0.746247618, 0.325765499, 0.584209282;0.724662538, 0.676483458, 0.88383247, 0.73337166, 0.883893522, 0.834207343, 1.72209422, 0.972048275, 1.08384918, 0.702573437, 0.882871392;0.39856823, 0.75171916, 0.523879626, 0.465360449, 0.551185976, 0.780964437, 0.972048275, 1.24266804, 0.731303498, 0.549260764, 0.787267134;0.367959427, 0.522215246, 0.59913347, 0.581799329, 0.718706321, 0.746247618, 1.08384918, 0.731303498, 1.24569051, 0.409197998, 0.677640812;0.655917434, 0.812422687, 0.437181045, 0.705770897, 0.485222123, 0.325765499, 0.702573437, 0.549260764, 0.409197998, 1.39429067, 0.55725828;0.496077335, 0.796094165, 0.522576361, 0.514365709, 0.461727899, 0.584209282, 0.882871392, 0.787267134, 0.677640812, 0.55725828, 1.20915608]
data_train = [0.958702407, 0.0578638978, 0.394521799, 0.106756066, 0.335660065, 0.169679904, 0.646848362, 0.388268384, 0.229394746, 0.265937925, 0.360345095;0.259949863, 0.453240847, 0.0323159511, 0.279763507, 0.411206721, 0.602781882, 0.270957643, 0.133185125, 0.0762003796, 0.940531827, 0.416639058;0.581162621, 0.919176552, 0.08274842, 0.876661486, 0.551587873, 0.164834261, 0.411255117, 0.777602284, 0.480370082, 0.985286051, 0.37673897;0.7495783, 0.392989449, 0.829164221, 0.569081469, 0.0635118296, 0.0368218676, 0.133852119, 0.0136719648, 0.0753590604, 0.691714397, 0.534346275;0.749910749, 0.913165752, 0.585149532, 0.726120844, 0.757081202, 0.377850549, 0.241084832, 0.205045329, 0.25144244, 0.274731797, 0.207227649;0.878220667, 0.756999132, 0.0468964678, 0.268672482, 0.022184742, 0.498165187, 0.476210697, 0.83137149, 0.30777724, 0.816385735, 0.967973765;0.0884082234, 0.791817839, 0.589955897, 0.480045967, 0.420535779, 0.784668264, 0.639361357, 0.805044668, 0.903151059, 0.617263712, 0.980462725;0.60808785, 0.636644322, 0.554815609, 0.0910020911, 0.726397033, 0.547446307, 0.450910447, 0.910471278, 0.297959452, 0.523602276, 0.697641871;0.796471776, 0.459346808, 0.842091415, 0.768917741, 0.0662359779, 0.0458612664, 0.620805684, 0.347413408, 0.209130791, 0.579649934, 0.34156321;0.537263417, 0.460119159, 0.584766106, 0.400300489, 0.697667574, 0.180067272, 0.696501466, 0.411661214, 0.874317605, 0.515236055, 0.973110349;0.601935396, 0.223849066, 0.821790637, 0.345082628, 0.347619214, 0.0318046815, 0.548715309, 0.534423504, 0.355991484, 0.894217263, 0.128748398]
data_test = [0.330099513, 0.321582765, 0.0922905862, 0.481145394, 0.687784717, 0.511657014, 0.156977683, 0.377285965, 0.00259502438, 0.868301107, 0.0845170077, 0.597278082, 0.986256996, 0.536590646, 0.924041759, 0.236116533, 0.759955409;0.531265754, 0.720516061, 0.0623413625, 0.147739092, 0.133116929, 0.687165505, 0.844440673, 0.749616232, 0.0304721527, 0.867214981, 0.354146671, 0.397163833, 0.104869167, 0.737405206, 0.182283878, 0.563965092, 0.840709986;0.0892043287, 0.535335564, 0.233216412, 0.342926864, 0.473969941, 0.355104303, 0.64882284, 0.479582102, 0.584199485, 0.736822475, 0.557742266, 0.586535435, 0.564458543, 0.378772626, 0.337446834, 0.899647397, 0.607555222;0.244353155, 0.498247698, 0.330348481, 0.933691824, 0.00753436313, 0.225332798, 0.36535682, 0.487809801, 0.850817518, 0.0878876245, 0.805864887, 0.0556534894, 0.842314035, 0.0516354779, 0.0182424814, 0.696961462, 0.997255535;0.896610263, 0.575998418, 0.917395613, 0.0053000064, 0.975067163, 0.490748779, 0.722896097, 0.820861473, 0.718457271, 0.535036732, 0.476619484, 0.838582559, 0.20507756, 0.967994067, 0.710952479, 0.199506927, 0.736247184;0.529840023, 0.707230096, 0.767779501, 0.0872901796, 0.506103956, 0.932014342, 0.320642192, 0.593883098, 0.369230482, 0.454267972, 0.548603118, 0.54892198, 0.201730462, 0.684571548, 0.0878681112, 0.138824773, 0.00271089941;0.116696064, 0.473166201, 0.606101881, 0.79428945, 0.10669925, 0.85072746, 0.745974526, 0.408518293, 0.932938067, 0.990929476, 0.20500181, 0.379228585, 0.926449424, 0.721596551, 0.048094644, 0.781514482, 0.827940887;0.750501925, 0.799537131, 0.825132677, 0.186404987, 0.235691746, 0.633758564, 0.90786613, 0.316196582, 0.588306676, 0.682982063, 0.451948601, 0.713782455, 0.899667445, 0.624101544, 0.539781062, 0.438744675, 0.577486271;0.355362452, 0.39148211, 0.53185748, 0.0666191124, 0.229025391, 0.542849311, 0.431528143, 0.332815786, 0.730549137, 0.693717607, 0.16673076, 0.878629115, 0.495423626, 0.741460911, 0.573150849, 0.997692616, 0.75240312;0.706980461, 0.778571939, 0.143127986, 0.204544593, 0.714064082, 0.493981487, 0.754635292, 0.102916031, 0.536481351, 0.378821566, 0.457000219, 0.603957872, 0.502288347, 0.539860637, 0.486357482, 0.408955177, 0.771881981;0.0122030723, 0.598442701, 0.565508347, 0.716179075, 0.599029365, 0.826798828, 0.959074795, 0.342524257, 0.227350983, 0.423596862, 0.287929616, 0.614950263, 0.911852409, 0.139116194, 0.100794603, 0.256015532, 0.726095586]
max_shift = 2
km_test = [0.600621949, 0.961620656, 0.557425502, 0.29540835, 0.590062616, 0.756053083, 0.73057925, 0.803506054, 0.635062261, 0.598979895, 0.707703146, 0.899335182, 0.509341867, 0.726743118, 0.509363387, 0.555814415, 0.765262982;0.614814207, 1.06552382, 0.924968368, 0.365365296, 0.422175284, 0.893415145, 0.733302472, 1.05652416, 1.02580613, 0.661891905, 0.943660046, 0.741782123, 0.49934965, 0.882635189, 0.31677463, 0.666722825, 0.511731154;0.659280964, 0.795407925, 0.684521869, 0.502183871, 0.607139963, 0.586857521, 0.613904125, 0.493276033, 0.797927894, 0.347162647, 0.704376978, 0.79164675, 0.651272374, 0.490058568, 0.574071171, 0.574499206, 0.553450729;0.6651647, 0.916368986, 0.621612942, 0.506783722, 0.597116557, 0.553733294, 0.597277785, 0.965613515, 0.882876679, 0.436064997, 1.23261152, 0.684056598, 0.403992414, 0.547440527, 0.509219032, 0.861849666, 0.511363037;0.724170528, 0.789698137, 0.563971511, 0.569851846, 0.667967643, 0.616189158, 0.623523817, 0.767203156, 0.508698459, 0.507312473, 0.824726493, 0.68934097, 0.433272791, 0.567635352, 0.680903236, 0.56185837, 0.405624214;0.661644729, 0.605676661, 0.725814908, 0.526899516, 0.469364405, 0.68605277, 0.369493658, 0.905919474, 0.477723868, 0.581590619, 0.746639533, 0.4998409, 0.343973914, 0.659670608, 0.568810178, 0.460043147, 0.187841265;0.851705138, 1.18779084, 0.793634851, 0.607991319, 0.783382071, 1.21090801, 0.872435399, 0.821554444, 0.672292301, 0.908296232, 0.83911351, 1.16245487, 0.7710065, 0.919205439, 0.829741586, 0.754214357, 0.593434931;0.510733764, 0.841086657, 0.764414087, 0.411861822, 0.39079492, 1.01137486, 0.644330882, 0.627662822, 0.62535966, 0.697304313, 0.574161776, 0.69304122, 0.603349041, 0.725022046, 0.354464591, 0.580401379, 0.354525769;0.539266874, 0.699580796, 0.618713396, 0.583020159, 0.53092722, 0.704624732, 0.503365869, 0.570982193, 0.56703577, 0.427536656, 0.709015037, 0.58660075, 0.496617418, 0.50576563, 0.472466615, 0.482476429, 0.267561329;0.400051048, 1.1167073, 0.40508163, 0.374481987, 0.398647886, 0.906054599, 0.941880527, 0.736433477, 0.658027339, 0.805345188, 0.698732509, 0.725105059, 0.603433724, 0.644443777, 0.317372644, 0.759743138, 0.818865164;0.496384934, 0.893785698, 0.743884927, 0.329139368, 0.366969287, 0.973784147, 0.669615898, 0.612502031, 0.701543636, 0.698958195, 0.562288338, 0.744351079, 0.601800017, 0.795125167, 0.32348898, 0.520704839, 0.431713343]