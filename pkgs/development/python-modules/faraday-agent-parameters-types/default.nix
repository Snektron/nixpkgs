{ lib
, buildPythonPackage
, fetchPypi
, marshmallow
, packaging
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "faraday-agent-parameters-types";
  version = "1.0.4";

  src = fetchPypi {
    pname = "faraday_agent_parameters_types";
    inherit version;
    sha256 = "sha256-ldGCn0VzoMRFekCPMprNLpaL5Jts5MRv5Ym1qoJwjXA=";
  };

  propagatedBuildInputs = [
    marshmallow
    packaging
  ];

  checkInputs = [
    pytestCheckHook
  ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace '"pytest-runner",' ""
  '';

  pythonImportsCheck = [
    "faraday_agent_parameters_types"
    "faraday_agent_parameters_types.utils"
  ];

  meta = with lib; {
    description = "Collection of Faraday agent parameters types";
    homepage = "https://github.com/infobyte/faraday_agent_parameters_types";
    license = with licenses; [ gpl3Plus ];
    maintainers = with maintainers; [ fab ];
  };
}
