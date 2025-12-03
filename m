Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E592417C6;
	Wed,  3 Dec 2025 02:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764728596; cv=fail; b=lZre0xEY4Nt9Gji+Lj9LqDMNGMPnTIixNSqpYAe7S82Ft6g3J0vjODEJPiWsrFhhJdzLz2iezpVymh++bUSYWVPSV7K6LurYJqGhQZMkuTPfWxitPcFQ6mMmX3h53wdc0UIB4rLsaYKb8PlOTlXwIgcOm2/qAa9WeclANjMcOjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764728596; c=relaxed/simple;
	bh=wg0rGXy5MXu9n3qboQbH05696Z3dEJSxsnbSKWq9uZc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=RFElRPDtSoDerdTzrNOBcxiPzz6fYKNVGnpNz+eV0p60CFYVr7pjGcS9Df4FSNyVLqDnvunQEzC4UQi3ulfeu0IGX7FAJiwqL6ntuwVRidtWfWlAbTsXJC3OIVOif7UoG8UlNQGtpLrGfW4eqHEKBucrcccxLFo8WerrsXTNHy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQHFoo9S; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQHFoo9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764728595; x=1796264595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wg0rGXy5MXu9n3qboQbH05696Z3dEJSxsnbSKWq9uZc=;
  b=fQHFoo9SmxiUM84epvmlc4DMD2xuKV4C5CkRj7/qzTHneGSQVMPJnVLT
   DOh45RSNOvsAHFI8Yja761ZjXhLIYIO79o/hGnAur9fwHPd7aWvg1kh7j
   dS7gh/aXr15dIa5thRagRDwv1XD7u66GdVhWrMeDM6r3ZX7VUHiXV0Zwl
   DYYsQylPzPVPBkZyD5Rq1wRYRZ8OwMfHZtB72y1xwHqZ2Wf+gAMMR12uf
   8LjEHnBdSOJyNZW8WYk9QZyBfS3MLj4s4s4RoaDwVxJC6poqoM/BdbwKH
   JhorZXfj2PrR+TUz/EgRxGpN+ws1gbcTNjYm4XqYkrIILAQhZzOnkZwAl
   w==;
X-CSE-ConnectionGUID: zLvnBTg1Q+W5XlWSG8LMjA==
X-CSE-MsgGUID: 12BVSP64TPqCrOYYH60nKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77034779"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="77034779"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:23:15 -0800
X-CSE-ConnectionGUID: 01qVUH2qQAaksGLI+8Qn7A==
X-CSE-MsgGUID: Omn9moYfRz6UON7s/n5L2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="193632289"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:23:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:23:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 18:23:13 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:23:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gofnXvIDBME9O9M/udZpauXsIHRJeGf+8EZWansF1jK6kJlAXXqJL5wAm70h9ohr1FTOO7BMBkqi+9B2zPYYaq/Z/XMOROusHsuRZATVeAE/q7H2hWr8sZsVjEQO51b3bpWIkfeg4B/1VkYcOyYsth/mAleAM16tl9p7gDFP3l0WBfV48wqVVfRGU3WEZDv2zXWPXliiGVQ8m7MNxabDa3vhDZ5HZwXDC31hxp01WwJG+MkdVqULAYseTewqGNWOc7zpEuHxnkUXPlK7yaKr+y9GyCRs0/RTQ1Vw+ZYCdjkpOwlHK0dgvKaqtj1WMJTFGBtITmdGByQHMu+PnEQyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tJm+FIu/ZmXHn4Cn6/TOMWNOMsux+UO0fWuOeDgh+w=;
 b=oqbtNNSmkNWpG1ZRH37Xyoj6H3pJNGxK+ArL3nFPMNYUBXlxOnWFz8uoMuBeNbluEy92QdEI5LyFj/kHbIi11eP/8aQ+tr3K7JWiX650ev/BRk9ndt+50IjRXUvqRKJra0l958rzO3dkoLtV/qrxEoFnTCp1AUbPCT6xJFKGX0Kxws5DCY56uMn5nymgHzxAhjszYEvqqSu/k++pE3OXkkms1a3WG8RI9p7+HdKFnMnfqzauAv+8tHxOzvW1EZdWE6iixlu/gHwRP27AcPwYCbxEukPesCttT7F1JvCdRb/l7Y8zMcLtxMWdxk2PTEFuP7s6vggSC2ObMsyEqc9Ebg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 02:23:11 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 02:23:11 +0000
Date: Wed, 3 Dec 2025 10:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Rangankar <mrangankar@marvell.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, 0day robot
	<lkp@intel.com>, Nilesh Javali <njavali@marvell.com>
Subject: drivers/scsi/qla2xxx/qla_init.c:8490:28: warning: variable
 'fragment' set but not used
Message-ID: <aS+fBp3iMESSlm5y@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: f7549540-cb5c-4b13-08ed-08de3212e7c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y4tmU4LY+Bof4WZ3vJ3UI8Kuizcg0RwO2y7kB+faBbIGu/6PX+lrEFxWawh+?=
 =?us-ascii?Q?+LgJTR+GHOVbNL/dCauIl/AfmqWUmwEfYQy44AiH0SjUKkT4yBL710YY/ukB?=
 =?us-ascii?Q?xHHwAtOojR9tkggEFuvbaDeCVet0wfllzsJl9XU4/aNwCC0TqfO763Avjr94?=
 =?us-ascii?Q?pDRGtV10CPh91dO1GiiPVaoe2Tbxc3eeEm3EesxpDX2/biiyzvoCYlCtgx4P?=
 =?us-ascii?Q?8fpR7+nI1wX6vgvDihbYyqHJDT93j2SC53sveKoguUpK57LCZ/Cg3ttUr3qr?=
 =?us-ascii?Q?9ZQEh2o4B/vogNjegnv2y5Z4XjWbLAj6q+H+x/r06mAXOr+liAqanJBh9Ktl?=
 =?us-ascii?Q?kXOYhqB+6pKlSeVlrht3QYB+jXsLmScr+4bBVfDVM1/0F8+fYbwlgLQW/Zwk?=
 =?us-ascii?Q?qRmONNOUOvSDVFWnkdtN20WNReDIsgcgUKd7fVCCAU8ITfnUv0Pkd6hDuOBq?=
 =?us-ascii?Q?TK/s+j0MqaijA99Mc7IdRSkMTwXE8aF1VLb6hjLCjHMbiu8vysQWMJ2B5iHZ?=
 =?us-ascii?Q?PPZDX4sLnfVAvT95JKaGE0+Gv3goBo2MTfuWyRw5ZYYz5bKXTlue2JyIX5dT?=
 =?us-ascii?Q?OiQUhdwBqwSBfmpL9ZAUqlGYlxobGzUjl7SFeS26DGvzYPAIXf9kX1mHYwqI?=
 =?us-ascii?Q?RaxV+FfBSVG1ww78GgCfLUX3WmmhzsobMTnOuiDrbxsownXwiz6xwKIehin7?=
 =?us-ascii?Q?2PxFOOeEKpZw0/U0bbAPf0ntHo1uaUaaOME2P2BvjvJRE0QbBnY7Z3NBlNxb?=
 =?us-ascii?Q?OdPQtRXJJSlTTotf2kD8K1se5o7WTnXoO17j8HWFiLrzG7jm/WUGNR46j2tK?=
 =?us-ascii?Q?7T708aamJGVjke42SojT88hSUGQA7n/iC44e1IQH+vgQiBHt8wkfOF0oKFhG?=
 =?us-ascii?Q?ZYWzA9eYgfRrLds8pEL+mtlO3otaoyTNt11W8bCRpFSmttHKRSDlYI46zdMJ?=
 =?us-ascii?Q?eKLR/88zDM8vF6pCkjHjEY2lXzDOFLC5N19FU9EMxwwGTkRK2y0pi8nuTqs3?=
 =?us-ascii?Q?xZhqr7vqXKAqz8qIVndOXC9hk9raCgp5IUFOj9Mk3Lsx6pg640Ys7874C8sn?=
 =?us-ascii?Q?is9wJDrZaQzBibvKch+qKt8+APCsIQ71Z56eFkJcUwrQLL+OBOdM7ambUyk2?=
 =?us-ascii?Q?ZapVeF9yIPyI4G7toCCnglhxEt+RCY+9Jv0bo0RowTvOWBSDjKOuXC3WZBBC?=
 =?us-ascii?Q?wBJNBvGbG+kC3U+T5Lka/2dEItlG116veYP1bI3dIPvw5GY58qzWDH46jvqs?=
 =?us-ascii?Q?fNDmPMa63WMBCG91AVZuHcUxwVIVgb0KBQ7Z/RMfSFN8h7+JKxhyqA4MVXAa?=
 =?us-ascii?Q?25wPUikTgqyqphYhhm5ykavEIWasS/6IximHqZA4BS9hVZQinm0EfCqv7jRN?=
 =?us-ascii?Q?LugXt6XFedVea/KLCob2wNClUjkKrRqme/sXuyPcI0uq1NrHU3Z+/P4KGCfB?=
 =?us-ascii?Q?b6HAdv+GkTxk+VloJBVw9cmYWWodjT0UpqGJKtPfqicBm2lKDljcPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YKxELY7e09cHvaEN6XG5kuzmMy+VZ+BWRgZOxdn20fmJe8RrE0ss5zxnhx2N?=
 =?us-ascii?Q?v+OD5yZK5laZ8T9yNcJX8W2AVUAKZKHNQoSPdXlTBpveeG4zAgxMEtE/VGa3?=
 =?us-ascii?Q?8BKdWiLLMQObcwoTF519uKHSpwFiHyZEkI6VVV1UpsLejCa1hrkPwFPmPGzZ?=
 =?us-ascii?Q?CQjNtQcpp4BuU3oHQ/T9gNlzbphBTGuMZvCvRJoQpV1eWOu9KZbHs+J6QnSM?=
 =?us-ascii?Q?PbaOu+oi5o3tcCKHgnQZMAyFVk/wezqzoqKtXTQWh+ZynaM/PMpzG0/DOofS?=
 =?us-ascii?Q?bxaB3d4GjicZnHj2aU/R2Pbh5VYidzU4ccUcOmDXP4q7X6aXheWC3DAyZqJ8?=
 =?us-ascii?Q?Y0xhVQvzUzJr7AQiri/G1D4kx1r5l5iy5KcIS5Oyvj9ajY++0mf2ytT7xPJ5?=
 =?us-ascii?Q?svkTH7fJ+hbRm6Uyvp5ixffWyzHlgKs+vazB2QhDfbMTZ1lprBLQH55r8PsE?=
 =?us-ascii?Q?E6ThH6HzVigIx10IOIyhmwRs1sdQnuxIJlLAbKAw4z9lFCn9a35DkIZh7OGM?=
 =?us-ascii?Q?VmljO0C7OLWQBsczbFUujWQQE4qhCY7EDZZ6hTP0b7RPkDqrAEhT+RG8ihdJ?=
 =?us-ascii?Q?vV5TyzxC0OFjEcDA38+6oOmaaQl6HMb6+xHH1YVUx+Hi52dWpX8fmLAxhIkR?=
 =?us-ascii?Q?47ceiwTj8qYy38ck1E6vh8Gmac8WmHtcRtjuLKsuvBT3yZLs/YBkRN1hFEeo?=
 =?us-ascii?Q?dqFMLtjGqkp2FUNmR4EWQUoUOlWVacp1xuYEH/GJXdE0ukeL4beQ2zpT8aF4?=
 =?us-ascii?Q?Z4o4HjrooZvFJAE5e844fAyLcceaAG5xN/SNkjdOFVLCl8eU8X+O/cx8NH2T?=
 =?us-ascii?Q?rEEzYFB2B84cWznqDbtu0udubtV1BI2thQnx0QMwKkfX3RF+2lbwcfGAGOnm?=
 =?us-ascii?Q?PsgjgnPeCdg2qPRQ9kxiA5+LNDCw8CVYnL8/94TyZqZr7mUxGFRm10vZcfZr?=
 =?us-ascii?Q?ADQGxvBsQNYHaq12xN1ncdZ/4gAFckTb67whwQA+jtB+DFB3y3T0gGuavvGJ?=
 =?us-ascii?Q?EHw65a7dsWe05QpRvWuMPKNaG2oKDlXLBprKmwWn9pbqHxZPRErvUdxx4QyH?=
 =?us-ascii?Q?SvKuRF8dzrhbpZIa7ehZlgfYEANcLc1hpDndseWTVulHlIourzaF6GiaqYAm?=
 =?us-ascii?Q?hmN172n52OANGABOca2iQhckP5aU1Yy6XHwuh7fZOpxEfYrylf3L4idSo12K?=
 =?us-ascii?Q?S6lewfkTteLaKhvaqTWId5yd7Ds1GYh5iQrauMzbk9xE73xQkvTmE9EBJSJo?=
 =?us-ascii?Q?5IL1okUo1dvQd86BRl0nKjC/eJcZsu9z9DLyOhXbqmR1dz+igdxqmgq8Lybm?=
 =?us-ascii?Q?kEd14zqqD0z1ci+yP73wQZs8830iEasYHTb0aNptCAiaQuK302WLMYXF9xtj?=
 =?us-ascii?Q?7TtuI0dJM7eYOzzEbYU/xDHsXuK0Ct+ixCnexquQKiKYvsMfb7YXlb4T38+5?=
 =?us-ascii?Q?myxMPkrnrwpg6kUioYJSKDRN0e2duBlv1b5nkCgT3Ks+/qK6/CJZWg88spTj?=
 =?us-ascii?Q?ZJAJkF9MhnivXqlaTSM5KxAKcDvvVfG3zl49DHvFQU+/77zki24cMoefl/j4?=
 =?us-ascii?Q?309vAJVKc0r4plICQne9X17bOXMzMjqf6i6sM/+UVUwycwo3/KuF7iQg+8Gw?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7549540-cb5c-4b13-08ed-08de3212e7c6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 02:23:11.6097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKhup/kXNgqviyRHq0FzO4wSuX5QUghR5MR33PnS8maULcltQQmIrxS3SXmE22/uKQuIIbgNZHq/ZM+360VDvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Nilesh-Javali/qla2xxx-Add-Speed-in-SFP-print-information/20251202-140943
head:   72ffa216e20607b795b5962d24ebee31661864b2
commit: 1bfb31c14b23902a2fe29ecfd75b669ced4b2dc0 qla2xxx: Add load flash firmware mailbox support for 28xxx
date:   12 hours ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251202/202512021947.U82G4ELP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021947.U82G4ELP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021947.U82G4ELP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/qla2xxx/qla_init.c:8490:28: warning: variable 'fragment' set but not used [-Wunused-but-set-variable]
    8490 |         uint templates, segments, fragment;
         |                                   ^
   In file included from drivers/scsi/qla2xxx/qla_init.c:6:
   In file included from drivers/scsi/qla2xxx/qla_def.h:12:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:11:
   In file included from arch/x86/include/asm/msr.h:11:
   In file included from arch/x86/include/asm/cpumask.h:5:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:13:
   In file included from include/linux/string.h:382:
   include/linux/fortify-string.h:580:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     580 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   2 warnings generated.


vim +/fragment +8490 drivers/scsi/qla2xxx/qla_init.c

1bfb31c14b2390 Manish Rangankar 2025-12-02  8482  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8483  static int
1bfb31c14b2390 Manish Rangankar 2025-12-02  8484  qla28xx_load_fw_template(scsi_qla_host_t *vha, uint32_t faddr)
1bfb31c14b2390 Manish Rangankar 2025-12-02  8485  {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8486  	struct qla_hw_data *ha = vha->hw;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8487  	struct fwdt *fwdt = ha->fwdt;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8488  	struct req_que *req = ha->req_q_map[0];
1bfb31c14b2390 Manish Rangankar 2025-12-02  8489  	uint32_t risc_size, risc_attr = 0;
1bfb31c14b2390 Manish Rangankar 2025-12-02 @8490  	uint templates, segments, fragment;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8491  	uint32_t *dcode;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8492  	ulong dlen;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8493  	int rval;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8494  	uint j;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8495  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8496  	dcode = (uint32_t *)req->ring;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8497  	segments = FA_RISC_CODE_SEGMENTS;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8498  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8499  	for (j = 0; j < segments; j++) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8500  		rval = qla24xx_read_flash_data(vha, dcode, faddr, 10);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8501  		if (rval) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8502  			ql_log(ql_log_fatal, vha, 0x01a1,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8503  			       "-> Failed to read flash addr + size .\n");
1bfb31c14b2390 Manish Rangankar 2025-12-02  8504  			return QLA_FUNCTION_FAILED;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8505  		}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8506  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8507  		risc_size = be32_to_cpu((__force __be32)dcode[3]);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8508  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8509  		if (risc_attr == 0)
1bfb31c14b2390 Manish Rangankar 2025-12-02  8510  			risc_attr = be32_to_cpu((__force __be32)dcode[9]);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8511  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8512  		dlen = ha->fw_transfer_size >> 2;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8513  		for (fragment = 0; risc_size; fragment++) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8514  			if (dlen > risc_size)
1bfb31c14b2390 Manish Rangankar 2025-12-02  8515  				dlen = risc_size;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8516  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8517  			faddr += dlen;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8518  			risc_size -= dlen;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8519  		}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8520  	}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8521  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8522  	templates = (risc_attr & BIT_9) ? 2 : 1;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8523  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8524  	ql_dbg(ql_dbg_init, vha, 0x01a1, "-> templates = %u\n", templates);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8525  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8526  	for (j = 0; j < templates; j++, fwdt++) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8527  		vfree(fwdt->template);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8528  		fwdt->template = NULL;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8529  		fwdt->length = 0;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8530  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8531  		dcode = (uint32_t *)req->ring;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8532  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8533  		rval = qla24xx_read_flash_data(vha, dcode, faddr, 7);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8534  		if (rval) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8535  			ql_log(ql_log_fatal, vha, 0x01a2,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8536  			    "-> Unable to read template size.\n");
1bfb31c14b2390 Manish Rangankar 2025-12-02  8537  			goto failed;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8538  		}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8539  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8540  		risc_size = be32_to_cpu((__force __be32)dcode[2]);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8541  		ql_dbg(ql_dbg_init, vha, 0x01a3,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8542  		    "-> fwdt%u template array at %#x (%#x dwords)\n",
1bfb31c14b2390 Manish Rangankar 2025-12-02  8543  		    j, faddr, risc_size);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8544  		if (!risc_size || !~risc_size) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8545  			ql_dbg(ql_dbg_init, vha, 0x01a4,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8546  			    "-> fwdt%u failed to read array\n", j);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8547  			goto failed;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8548  		}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8549  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8550  		/* skip header and ignore checksum */
1bfb31c14b2390 Manish Rangankar 2025-12-02  8551  		faddr += 7;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8552  		risc_size -= 8;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8553  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8554  		ql_dbg(ql_dbg_init, vha, 0x01a5,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8555  		    "-> fwdt%u template allocate template %#x words...\n",
1bfb31c14b2390 Manish Rangankar 2025-12-02  8556  		    j, risc_size);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8557  		fwdt->template = vmalloc(risc_size * sizeof(*dcode));
1bfb31c14b2390 Manish Rangankar 2025-12-02  8558  		if (!fwdt->template) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8559  			ql_log(ql_log_warn, vha, 0x01a6,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8560  			    "-> fwdt%u failed allocate template.\n", j);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8561  			goto failed;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8562  		}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8563  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8564  		dcode = fwdt->template;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8565  		rval = qla24xx_read_flash_data(vha, dcode, faddr, risc_size);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8566  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8567  		if (rval || !qla27xx_fwdt_template_valid(dcode)) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8568  			ql_log(ql_log_warn, vha, 0x01a7,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8569  			    "-> fwdt%u failed template validate (rval %x)\n",
1bfb31c14b2390 Manish Rangankar 2025-12-02  8570  			    j, rval);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8571  			goto failed;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8572  		}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8573  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8574  		dlen = qla27xx_fwdt_template_size(dcode);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8575  		ql_dbg(ql_dbg_init, vha, 0x01a7,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8576  		    "-> fwdt%u template size %#lx bytes (%#lx words)\n",
1bfb31c14b2390 Manish Rangankar 2025-12-02  8577  		    j, dlen, dlen / sizeof(*dcode));
1bfb31c14b2390 Manish Rangankar 2025-12-02  8578  		if (dlen > risc_size * sizeof(*dcode)) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8579  			ql_log(ql_log_warn, vha, 0x01a8,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8580  			    "-> fwdt%u template exceeds array (%-lu bytes)\n",
1bfb31c14b2390 Manish Rangankar 2025-12-02  8581  			    j, dlen - risc_size * sizeof(*dcode));
1bfb31c14b2390 Manish Rangankar 2025-12-02  8582  			goto failed;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8583  		}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8584  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8585  		fwdt->length = dlen;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8586  		ql_dbg(ql_dbg_init, vha, 0x01a9,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8587  		    "-> fwdt%u loaded template ok\n", j);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8588  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8589  		faddr += risc_size + 1;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8590  	}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8591  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8592  	return QLA_SUCCESS;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8593  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8594  failed:
1bfb31c14b2390 Manish Rangankar 2025-12-02  8595  	vfree(fwdt->template);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8596  	fwdt->template = NULL;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8597  	fwdt->length = 0;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8598  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8599  	return QLA_SUCCESS;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8600  }
1bfb31c14b2390 Manish Rangankar 2025-12-02  8601  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

