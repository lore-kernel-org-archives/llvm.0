Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445723FC7
	for <llvm@lists.linux.dev>; Thu,  9 Sep 2021 01:00:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cw3tDu6rU82+ez9DYzSbLBaqqlS7dNZtHUhm4feEe73bJtYUntH70Yz69cIc7npxXeXKyISkPi9xmwPgtYMAcLh/3Y0XeitSVcBzcZBGa2B+JsAArp4Gtn9ajXlnsmvexvoZAzxrAZx+3McR5fBBIN9A55p2jTMHyHLLCwzTD3Y0VaRijpOjl/yMxKtjOgyxHCTgUpS5FprKOp6MupLwqyhLxipfo+O1zpIlquOVsEAwUAziz4xEN6HeI4QnKbo7mX92clZUGqnvE5vSBLLQtQ1n0Jr5XXbbDBinpBxNu7/U7ZNbtPZCNfjeUIvXcT5qEtunbASd9tkmQY90Z6e43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0wzsCw4OTMJwXSin/7Bj9UKzF0GoJeDZdXYfl86vZMo=;
 b=XFQ1Lx2/3OESX+lwi10r5tClRPpklACNpUuTS3wqmUWiK8CJWkJYTEkX03tP0XLquugW9Wl3/dUNl6ELougp4+Zzj50SLek4UjJ0yompWYMXEaSNCml5f92YkEn0iGFjgVJyfmmGMd9ejJpay9DVEaGcG+B4Ga0It3I4Rb/v7Nju6QuDYEwtYpQdjRRt3z8NioLjhciQXfD43nA6o6E3wPANx1ydC5j95jQmheHQMy9SwuAbLJqwd6dtlWD2nGsRReUgvbgBrWvut1SFkycGmt9pW9Zn0NTDAKEihEnMfQlSdiXfcW25DOu5hG3OpohkFvrTaBZvqetoKYiI+EkDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wzsCw4OTMJwXSin/7Bj9UKzF0GoJeDZdXYfl86vZMo=;
 b=XoKgvRnc8hbVz2WcZ1ZZphm9X5SbKYT7zP1chiGIuOTYWE60L+5WBo+xTzzNLDSwdk9yYfbJufYPu/0JfXgUZqSeYjrstv4QoS4ml4Q5YhwCG1k7ewTc2a0V8fSiAwPlGVvwMP7evNXqnkkt7KQDr1tP19H4BFSVdJ2v3w0P9So=
Received: from CO2PR04CA0122.namprd04.prod.outlook.com (2603:10b6:104:7::24)
 by CH2PR12MB3959.namprd12.prod.outlook.com (2603:10b6:610:28::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 01:00:27 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:7:cafe::3e) by CO2PR04CA0122.outlook.office365.com
 (2603:10b6:104:7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 9 Sep 2021 01:00:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 01:00:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 8 Sep 2021
 20:00:26 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Wed, 8 Sep 2021 20:00:25 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <ndesaulniers@google.com>, <torvalds@linux-foundation.org>,
	<linux-kernel@vger.kernel.org>, <arnd@kernel.org>, <sunpeng.li@amd.com>,
	<alexander.deucher@amd.com>, <christian.koenig@amd.com>,
	<Xinhui.Pan@amd.com>, <nathan@kernel.org>, <linux@roeck-us.net>,
	<llvm@lists.linux.dev>, Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH 0/4] Fix stack usage of DML
Date: Wed, 8 Sep 2021 21:00:19 -0400
Message-ID: <20210909010023.29110-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95d374e3-1f0d-4933-3945-08d9732d3676
X-MS-TrafficTypeDiagnostic: CH2PR12MB3959:
X-Microsoft-Antispam-PRVS:
	<CH2PR12MB3959F568E4130D92CB39D3888CD59@CH2PR12MB3959.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	69lCgGItnd7oRuA+g4q86/nPBKHUFPSODeQ2hT3auiYoEVbjRBOt5cWxfRd0IVbuvRLjOQCrc0vdXWfAmLSsk2sbRCZzGJhSklEbuQed3dU+dea/6fWofk73OvicNO/bYtC3kyOZc4BUP1mLPaS7MMnavwl5P4XTWv++nx43RimmoiGvia/uCa5w/11sCh5AI5VaUU5zFek7W4UsHEs6rtXFFm6gb4T9YantxYfzyd//FY1zlKeuqk61Nb4iXU6p9rPEH2bTJ3UD8cVzcM00719v3gN6IU5S4RY4GH9u1cyQhi4xueUSfYeJPxk5yOiH+ZZGNmxIW/oxlOlu6Ln3PMJLoYpcGiMdC50kCVkLA0rpqj3Zfws7t90pp47DGeWXnOO+hlOAKZAbZCowjJrsP5uqbybSKDSk13uPAaMWNDghiGlsFlzl9KGr4O8FSB6vMO+9pEdyDw6yTS3o2+3QQhDDObV7xCCsHlRzVsw82FarKvLlkWETyKnVAx63//60A8bHlVfQVL/TORakhWtx3UCk7Gep8q4KesZu3BB0bR8sAbV3z3/7+ydgnW8tZoiupMcwbPuqprrjD8bp+LrdG75zjigmfK4IG4z6jMXFns4j6nalfdYoqj5qfs8yL9PCJgUrUnL4//OoKLl0URjCMEUpZhd0vHX4jZ4DVRntnPa8iRZoET72EjSmajBO3WGbDsH3NImZOebtnXL5zDyxsQHz+U2H5Vr6xBSf6SVXgks=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966006)(36840700001)(8936002)(6666004)(7696005)(478600001)(86362001)(70206006)(8676002)(2906002)(54906003)(356005)(316002)(36756003)(2616005)(1076003)(6916009)(36860700001)(426003)(47076005)(26005)(4326008)(44832011)(186003)(336012)(81166007)(83380400001)(82740400003)(82310400003)(70586007)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 01:00:27.2197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d374e3-1f0d-4933-3945-08d9732d3676
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3959

With the '-Werror' enablement patch the amdgpu build was failing
on clang builds because a bunch of functions were blowing past
the 1024 byte stack frame default. Due to this we also noticed
that a lot of functions were passing large structs by value
instead of by pointer.

This series attempts to fix this.

There is still one remaining function that blows the 1024 limit by 40 bytes:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3397:6:
 
error: stack frame size of 1064 bytes in function 
'dml21_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than=]

This will be a slightly more challenging fix but I'll see if we can get it
below 1024 by breaking it into smaller functions.

With this series I can build amdgpu with CC=clang and a stack frame limit of 
1064.

This series boots on a Radeon RX 5500 XT.

Harry Wentland (4):
  drm/amd/display: Pass display_pipe_params_st as const in DML
  drm/amd/display: Pass all structs in display_rq_dlg_helpers by pointer
  drm/amd/display: Fix rest of pass-by-value structs in DML
  drm/amd/display: Allocate structs needed by dcn_bw_calc_rq_dlg_ttu in
    pipe_ctx

 .../gpu/drm/amd/display/dc/calcs/dcn_calcs.c  |  55 ++--
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |   2 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20.c     | 158 +++++------
 .../dc/dml/dcn20/display_rq_dlg_calc_20.h     |   4 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c   | 156 +++++------
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.h   |   4 +-
 .../dc/dml/dcn21/display_rq_dlg_calc_21.c     | 156 +++++------
 .../dc/dml/dcn21/display_rq_dlg_calc_21.h     |   4 +-
 .../dc/dml/dcn30/display_rq_dlg_calc_30.c     | 132 ++++-----
 .../dc/dml/dcn30/display_rq_dlg_calc_30.h     |   4 +-
 .../dc/dml/dcn31/display_rq_dlg_calc_31.c     | 166 ++++++------
 .../dc/dml/dcn31/display_rq_dlg_calc_31.h     |   4 +-
 .../drm/amd/display/dc/dml/display_mode_lib.h |   4 +-
 .../display/dc/dml/display_rq_dlg_helpers.c   | 256 +++++++++---------
 .../display/dc/dml/display_rq_dlg_helpers.h   |  20 +-
 .../display/dc/dml/dml1_display_rq_dlg_calc.c | 246 ++++++++---------
 .../display/dc/dml/dml1_display_rq_dlg_calc.h |  10 +-
 .../gpu/drm/amd/display/dc/inc/core_types.h   |   3 +
 18 files changed, 695 insertions(+), 689 deletions(-)

-- 
2.33.0

