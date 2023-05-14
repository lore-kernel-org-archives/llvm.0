Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2027.outbound.protection.outlook.com [40.92.99.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6F5ED1
	for <llvm@lists.linux.dev>; Sun, 14 May 2023 10:19:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYmTz9LTJ40YQ6e0ouY044pI8vdLICJIvfHI5N6+3iyVT1MdjEvj+A8ue6EESOxu+Fr3R9MYecY+YkuZQLZcnLCdCN9QyoJuo3GYJ/ab8ZaP2r7F9/DQ5h6di+pf4f56hkQdh5n+0mjD9qG2ofnJOjFOAbT9SNRP9VMUan93NnBJkCZHmNYhHShd0B1KU3uI94sFGJ3N0QI2LzQx1b48kOpOPP11BsIujB7Ytd/zEPcTEqX6JG+OwdLvpDozB+GD0Rbz1TdpyILvUsDQ13TPi4YiG9QlHAAYYCj/sX9ZuEA4BtqLuAjzg4bFPa9PtH17/c/yatK1/fuspcivoJ93+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhuzDMAuorkDEF3jb3y5EZ7N+U3rtNhnEcYCexX/WW4=;
 b=CGA3qXQY/eLisZVACRK/neKJa3vMfHB9ly40Ddp9g+krPaB/L8Cv14yLCmtdXrmT15ViCRuJhQbl9m57i8MbITdLxj7lj+ZPvdstXbbbrG9zZp57+FmdH7BAuoFV6fc09lfWEjLq88YD9ZekSLjdi4Y9z0S+QCbMQFPTarljaq+f7EGTsUPoq0uTQVcA7XDqRsSOaYi0VLjlx48bQPVRPj97GwPBvz7h4A9eYVVDmHXFLnvmIMlGBNefkbmy9F734LQ5RBPV3WglMOs8pEXpzBECRjJT6uhYoABDB5xGqp2T/cCmjzU7ZgJmcfzThov9Eom6dRdzcUlOC85uBksm/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhuzDMAuorkDEF3jb3y5EZ7N+U3rtNhnEcYCexX/WW4=;
 b=aMqreVY2ApznAgJOHEpJ8yEsLWDhzdKMu6oz3QmYlnWtQTl+O3t/sgwuUUQx9Xk6yhz/U+t9IYRjp3oh9kfibKNPFmTXWDMqlvlD6nGEWgwdjsXk9WRV4iEFPPo7kRwHIkt7+fmcP898fmh1+8O7J+xOZpTxQYCAyyK0UPh+aDJ8IHcUFCWuEnPcUfWGfb8328L1ZKYOWDd151rF6dYct9+/SWclUkUTHjbWta70dYb1s/HeBhagjlagp/B/BMswQWN5B6Uhbi01ljjJawiB/0cSDv7jR2r8stj2fFyt0sgICcH6NVcB9Vl5eiPtaS13y78fOhIHL7vlneCPmnOclQ==
Received: from TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::14)
 by TYWP286MB3351.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Sun, 14 May
 2023 10:19:40 +0000
Received: from TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM
 ([fe80::d9fd:1e8f:2bf4:e44]) by TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM
 ([fe80::d9fd:1e8f:2bf4:e44%7]) with mapi id 15.20.6387.029; Sun, 14 May 2023
 10:19:40 +0000
From: Hu Weiwen <huww98@outlook.com>
To: llvm@lists.linux.dev
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Hu Weiwen <sehuww@mail.scut.edu.cn>
Subject: [PATCH] gen_compile_commands: include targets not end with .o
Date: Sun, 14 May 2023 18:19:17 +0800
Message-ID:
 <TYCP286MB2066DEF0E1810E8BC36F533EC07B9@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [+tLdRsBpQiJ+JAhJty+HY6q34NphAZKi]
X-ClientProxiedBy: BYAPR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::20) To TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::14)
X-Microsoft-Original-Message-ID: <20230514101917.232-1-huww98@outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2066:EE_|TYWP286MB3351:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0967eb-3784-4e5c-e72c-08db5464b9b4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZOwMV63AnSNznjV2ruF7WlwRS/Lx/iIDA0l1YvfZ1OH5xFjC+nl4zoWJ3tWVDQZlf5havkBz1tk8BNYQSy23zuG0gEWO6eLpXq6e8vYJwQC4/grGin04U+te4o/cAH+QQbE8vS+q1N1nNy2AcBMlx3OjQ/08Ah1EjqlQx9bpEivs3UW7zIQq97mKQRrJRZQa955YY/zY+ZXXr2n0Ca7v1AxsCpqh3pyAMAKMrz9FIDKMnsiKzdyUl0WdU7y8dui6atYNPkWyt/z/1WLUH/3mavyA7+Ee6XBnWFUU01QIf3NpnCKmdfq7cFrH8hPt8PAiydZq17S7PAPl+ql0NVWsBRk2e50yc+AlTPUdP0xITZtuileYBfxsk3Wgjkaym2BvpAlZMq93e5RJpj3V8jVt3O/tWVwenAtQpoobb227KdK/4b4PZcpmOcw6Xx9ETW+BKkUZh5zSmtpfsBlehFr7//6zNEeSd8TScs3McZ3tGWBjO31V0Dk5XctFvFj40DXT4UWMas93/VZiH789RBdiXq5LcYy7FEJCrTqtQrExFUSV6X9bN9z2w4PKW0Cfzs3M
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AcLyKNQ2zgku52xwSrgxzukOpoJ401OHKL94nApn/qJsBY3LjEBcIub8WMEX?=
 =?us-ascii?Q?7/iTDXU1yRqxweFaAwMSfQXY2++IL3oAlRG7kl2JagoM2OpHLYUxuTeduiXf?=
 =?us-ascii?Q?7rF8bPi5nc+Xiz0wuNz6LCefQcQ5k6gz1lX0tzVCg5OpG/RIOr9v67NDbQwf?=
 =?us-ascii?Q?mqsWdXN4kgwbH1TOdCgvYPb4ecM1VOgW94yuQch2BZxmMu1JeKCHvuhnWQGc?=
 =?us-ascii?Q?j0xzJy1t87SqBvzv9iJZFd8yUtuJzcijk6J3msQlffbGu7Z7vjkvw1eJFvg6?=
 =?us-ascii?Q?xRlV//thTWzCKfzGtOTQCvsc+6UGEFsXQNy+Z3XiFUMMI5TOfQ++8sW92TQo?=
 =?us-ascii?Q?GV6/HH1LQ6+yspxy2RJA8hh7s7eu4uMe7NtqP2lmHRg3WuKCGz4OShI+lUcu?=
 =?us-ascii?Q?9YRh9Q8g6bHbSNQm+ukmTaL1bVkOTHK0FTuHnyb2sFAb1xMQNIURXgsEjm39?=
 =?us-ascii?Q?zoVVJt55Cyo09fSfFDR3Tin1MhMkoNZ99LTorfVRptCnZcM5TMRaj6qa0kT6?=
 =?us-ascii?Q?GxgsNJxyMN3vDkwt/zy2WZOjHUhLr/LzZlMCXwyh+za8o16FwG0HS1Dw56ck?=
 =?us-ascii?Q?l2mt5jd4YN6y/g5Z2Yb4wsmf6AYpV/mcVu/lnOuDZzzExDb/biOcnRn93mM4?=
 =?us-ascii?Q?ZyhQSVv9rNHVEro/mEBgmtMXGGoM5FZQvBXz4zsKwjQKuQwVr+FAM0gcc492?=
 =?us-ascii?Q?14pa/sZhOEKJKHgkGNV2SG8bj3vtnL0bxQ5TTJnvoc4Q6js9BgFjS24jxQos?=
 =?us-ascii?Q?n3d0ybQRO8a3UyuRK/2FPtEpPzM9h6/VuvZrsJDTJebRx2fdShMp6JzPtM2b?=
 =?us-ascii?Q?5N+FMQ3rc9YCprGWptP3F+03C9F73PEOpuV8uxbK+KjAsynYc0mb/UAmAQhu?=
 =?us-ascii?Q?55dhlKQ4NmbU9nA+o+QvBiV0YJFq6ArMC7M0sfMMSll/ozb8NaB65w0M2BYq?=
 =?us-ascii?Q?oN7XBh9qBu65baZ8VOtMnA5zgmiO3Kv+06zS/lCSd46wHg3BH2NwqsS7Qs1b?=
 =?us-ascii?Q?NhZpE9yLE4clf0KYNFV19OlaAFuEGcgCZzMDIhB6DJIM1pExcusL95CIiYAh?=
 =?us-ascii?Q?sntjGAECYrCgqdfBaxh8w0ZVV3aha/JJAOdNdq1SYoLlhuHKW0FV6LMWGZas?=
 =?us-ascii?Q?4hzsZ10y4BSvKFeSmRnciLfR95H9h4kOKI+3GG5bbg9Nj9oK6365W4FaVR4t?=
 =?us-ascii?Q?G8PrPdgZRAkaWDKjhck315avHuz14TVNIId/Uw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0967eb-3784-4e5c-e72c-08db5464b9b4
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2023 10:19:40.0263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3351

From: Hu Weiwen <sehuww@mail.scut.edu.cn>

Currently, we only extract commands for targets end with '.o'. But we
also have many standalone executables built in-tree.

Remove this restriction. And to avoid some false matching, exclude
targets end with '.c' or '.h' when directly walking the directory.

Signed-off-by: Hu Weiwen <sehuww@mail.scut.edu.cn>
---
 scripts/clang-tools/gen_compile_commands.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 15ba56527acd..6e88c7e166fc 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -18,8 +18,8 @@ import sys
 _DEFAULT_OUTPUT = 'compile_commands.json'
 _DEFAULT_LOG_LEVEL = 'WARNING'
 
-_FILENAME_PATTERN = r'^\..*\.cmd$'
-_LINE_PATTERN = r'^savedcmd_[^ ]*\.o := (.* )([^ ]*\.c) *(;|$)'
+_FILENAME_PATTERN = r'^\..*(?<!\.(c|h))\.cmd$'
+_LINE_PATTERN = r'^savedcmd_[^ ]* := (.* )([^ ]*\.c) *(;|$)'
 _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
 # The tools/ directory adopts a different build system, and produces .cmd
 # files in a different format. Do not support it.
-- 
2.25.1

