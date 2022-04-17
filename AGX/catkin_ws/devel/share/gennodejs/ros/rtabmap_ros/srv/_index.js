
"use strict";

let LoadDatabase = require('./LoadDatabase.js')
let SetLabel = require('./SetLabel.js')
let GlobalBundleAdjustment = require('./GlobalBundleAdjustment.js')
let SetGoal = require('./SetGoal.js')
let GetPlan = require('./GetPlan.js')
let RemoveLabel = require('./RemoveLabel.js')
let GetMap = require('./GetMap.js')
let ResetPose = require('./ResetPose.js')
let AddLink = require('./AddLink.js')
let GetMap2 = require('./GetMap2.js')
let GetNodesInRadius = require('./GetNodesInRadius.js')
let CleanupLocalGrids = require('./CleanupLocalGrids.js')
let ListLabels = require('./ListLabels.js')
let DetectMoreLoopClosures = require('./DetectMoreLoopClosures.js')
let GetNodeData = require('./GetNodeData.js')
let PublishMap = require('./PublishMap.js')

module.exports = {
  LoadDatabase: LoadDatabase,
  SetLabel: SetLabel,
  GlobalBundleAdjustment: GlobalBundleAdjustment,
  SetGoal: SetGoal,
  GetPlan: GetPlan,
  RemoveLabel: RemoveLabel,
  GetMap: GetMap,
  ResetPose: ResetPose,
  AddLink: AddLink,
  GetMap2: GetMap2,
  GetNodesInRadius: GetNodesInRadius,
  CleanupLocalGrids: CleanupLocalGrids,
  ListLabels: ListLabels,
  DetectMoreLoopClosures: DetectMoreLoopClosures,
  GetNodeData: GetNodeData,
  PublishMap: PublishMap,
};
