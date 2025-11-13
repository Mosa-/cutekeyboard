set(HEADERS
    "EnterKeyAction.hpp" "EnterKeyActionAttachedType.hpp" "InputPanelIface.hpp"
    "VirtualKeyboardInputContextPlugin.h" "VirtualKeyboardInputContext.h"
    "DeclarativeInputEngine.h")

set(SOURCES
    "EnterKeyAction.cpp" "EnterKeyActionAttachedType.cpp" "InputPanelIface.cpp"
    "VirtualKeyboardInputContextPlugin.cpp" "VirtualKeyboardInputContext.cpp"
    "DeclarativeInputEngine.cpp")

set(QML_FILES
	"qml/AlternativeKeysPopup.qml"
	"qml/BackspaceKey.qml"
	"qml/CsLayout.qml"
	"qml/DeLayout.qml"
	"qml/DigitsLayout.qml"
	"qml/ElLayout.qml"
	"qml/EnLayout.qml"
	"qml/EnterKey.qml"
	"qml/EsLayout.qml"
	"qml/FrLayout.qml"
	"qml/HideKey.qml"
	"qml/InputPanel.qml"
	"qml/ItLayout.qml"
	"qml/Key.qml"
	"qml/KeyModel.qml"
	"qml/KeyPopup.qml"
	"qml/LanguageKey.qml"
	"qml/LtSrHrBsLayout.qml"
	"qml/NlLayout.qml"
	"qml/PlLayout.qml"
	"qml/PtLayout.qml"
	"qml/QwertyLayout.qml"
	"qml/RuLayout.qml"
	"qml/ShiftKey.qml"
	"qml/SpaceKey.qml"
	"qml/SvLayout.qml"
	"qml/SymbolKey.qml"
	"qml/SymbolLayout.qml"
	"qml/UkLayout.qml"
    )

foreach(_file IN_LISTS QML_FILES)
  cmake_path(GET _file FILENAME _fileName)
  set_source_files_properties(${_file} PROPERTIES QT_RESOURCE_ALIAS
                                                  ${_fileName})
endforeach()

qt_add_qml_module(
  ${PROJECT_NAME}
  URI
  "QtQuick.CuteKeyboard"
  VERSION
  1.0
  PLUGIN_TARGET
  ${PROJECT_NAME}
  OUTPUT_DIRECTORY
  "QtQuick/CuteKeyboard"
  RESOURCE_PREFIX
  "/"
  CLASS_NAME
  "VirtualKeyboardInputContextPlugin"
  SOURCES
  ${HEADERS}
  ${SOURCES}
  QML_FILES
  ${QML_FILES}
  NO_GENERATE_PLUGIN_SOURCE)

qt_add_resources(${PROJECT_NAME} "icons" PREFIX "/" FILES "resources.qrc")

target_link_libraries( ${PROJECT_NAME}
	PRIVATE Qt::Core Qt::Gui Qt::GuiPrivate Qt::Qml Qt::Quick Qt::QuickPrivate)

include(GNUInstallDirs)



install(TARGETS ${PROJECT_NAME}
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/plugins/platforminputcontexts/ )

install(FILES  ${QML_FILES} qml/qmldir 
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/qml/QtQuick/CuteKeyboard
	PERMISSIONS WORLD_READ
	)

