Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26C227727;
	Fri, 26 May 2023 16:21:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a83oqZnsB7QCSodh4o6cCuZnTnOMmsK4jnXk1MmV4uVLtX/r1MrUlDyDmxeeI0FKvM8/rvjKvWE0FszVdce/2BGZxf89NhStC2UZY7THvA+IpmXzdtOUyyxv51C99iOJg2HWVaS65clBiBB8aRkWCrl/gxmuuiVSmHUq6zzrV0UDPqbjmvkIlfZ0M5Kt/Pqk7sXWUfT4dfNGc0jUdRt5ljQmq8n6lmI5TSuty6RPxcrUn0xNHKjEbtYz3Qk7DgqxgTMk30ycrq4lj258SMHDHR/qRrE2UhevEyPkPWI4UzBUqq4A/WJmkCLUgit9dJ1UfQzrj7Y+A7NO6HlnIUXYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35Bu7eLpylLSxc9G+a0OlrC8YGGhou+QNR1je310b0k=;
 b=IaaGjR7oQ+jo4dx5sJy3Um0xoGUlJBGBVxIF1GjvdKGg1V3j8t/oIWd08PG1YdMnMbWSENFDSY2RT4twFrmTjDxvirHYrqHDHpoRsDmHB1TmEnol87FWWhHN6PIE3UZz3yLdjWcAA0+xt8YiUiPLlCWYNZmPjaqAoVcMg49yoXpxOB2p5pB/UuQ+7Dh0D7vDusfaiObbb9ZNgk7D3v/8NzqAuCqCgenPVXAERrnVbpAoN3BSwTYLp2/2eHcfEl8oLqFWaXIMZXaSLROx/bpPL2/+EtfNDZ2VXgoILkEu1qAiaWDPBr41wLZjghZKqMR/G4y8oV5qGIDhLgEmAPHztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35Bu7eLpylLSxc9G+a0OlrC8YGGhou+QNR1je310b0k=;
 b=jHjHn9yL7XMR4SUyK+UyyzPw2pLUM3VwP00vZYLtNdGcRs0PcwpQ1sLC1cyCzA80bj4w97BJYQ9gNTuueoQdqziJ2BhjbVHsfkX76ZAjMb9tOqJhJ8iniavqa8YMsm60dfKLB3AqXWUFZezGGBWHJAxFLC8tocl2XMCVHuhJmVAmIobEknKixFCUJvAvvp7vJdBHL9R2/tCa0kdb9AQOZOr7u6ABzl1McTHzr7UuVKX4QvaRBZLmKJbuBWEgeuNZPiVjEdYK6bPwA5kpIrs/oUtzMQZdsJntMoBXe7BWM6RBvGIqaB1xzfuEM73yit6Dj0PRkbN8rzShQqV1VUrfpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5979.namprd12.prod.outlook.com (2603:10b6:208:37e::15)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:219::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Fri, 26 May
 2023 16:21:45 +0000
Received: from MN0PR12MB5979.namprd12.prod.outlook.com
 ([fe80::b62:e6e:fcc2:a232]) by MN0PR12MB5979.namprd12.prod.outlook.com
 ([fe80::b62:e6e:fcc2:a232%3]) with mapi id 15.20.6411.028; Fri, 26 May 2023
 16:21:45 +0000
Date: Fri, 26 May 2023 18:21:40 +0200
From: Jiri Pirko <jiri@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Petr Machata <petrm@nvidia.com>
Subject: Re: [jpirko-mlxsw:combined_queue 1/84] net/devlink/leftover.c:6814:
 warning: expecting prototype for devl_port_register(). Prototype was for
 devl_port_register_with_ops() instead
Message-ID: <ZHDclOsp0uhoBwR1@nanopsycho>
References: <202305251552.RoYyyaZH-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305251552.RoYyyaZH-lkp@intel.com>
X-ClientProxiedBy: FR2P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::17) To MN0PR12MB5979.namprd12.prod.outlook.com
 (2603:10b6:208:37e::15)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5979:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 04736743-10de-432d-91d9-08db5e054be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OVuEds6nGVDEf6nxbfxn3f2VYcEibESi2d54D9SaEVI1RT7Zxw3hjUaEUZ1csbbE0r/xeGnrb33NmsmsntmlT1rLSnYoCup+M0cGACyuZ65/I5i/T0zJFNY0VbIh3E88t7i6oorFkdrWuM4pu/HOwp5r+VcISH7QG6U1Cbf2q9z4dNQHjQ7g3lp3lLi0Hn+XRCfXa+7lAmd+3sMWwQh1ek1q3Bo7xcbMym6rN55Qy/hTXdR+ukRz6/6chFZqR4ivo5UTIe85Z7FJncSawyN9Ea8UNT2OeZWV7gwlxAa7RuiH03aJ/N+1VFZeUMEEc7tQVfDukjwq4K4oJYYZlqt9TGdc54/v1NKTshHthisoLnIeDeOjSrvD/S02AkKrA305uFu81DmVtrTGAEX5+vDJjPhvh8o/SC2TYmETid3zQveDMw6WGl18VjMLesQqiD4i7ixC4x2pJHpYb/tVPR8SdynZGjrFKqGYirMqdIk/UW2Lmg+JaN//wPdf+f8DiFPK9TPOEb2S9HoxdogQrV1hWBCPoTwUvMmCmZOjVA1kGdfU7uUVq+SaNlxFBTzktGqSwDe/KtQIt4t58T/lgTJ7RvDZADJ/Bv4yjV7ziYyFIGZ1UdVsLmRZiTFbf/bKfYxuSATujL2yUKX2c28nDvglnD5LiNFUlNce6qfdq5ApKJ0F9DJliZRNmrgL+5CIiSSu0f9eJSgkfh+Z9z2PxQzrx2Tf6NRw6PQT1tz8pNxBIRc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5979.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(451199021)(316002)(38100700002)(4326008)(66556008)(66946007)(66476007)(6916009)(33716001)(45080400002)(41300700001)(6666004)(478600001)(6486002)(66899021)(5660300002)(8676002)(86362001)(966005)(186003)(4001150100001)(107886003)(8936002)(9686003)(26005)(6512007)(6506007)(66574015)(2906002)(83380400001)(30864003)(95444003)(46800400005)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uq8hStQaWi7vS8kqfjAwcRVfUNPitw7pAadWDI+AD5YUa97pHa8xQmGCesIl?=
 =?us-ascii?Q?Vj/OWcYoa/g9lKwHepT1p8uiegzVtjezPOWGk/YfbPTQxtxBLTfQZLHN+PeE?=
 =?us-ascii?Q?2GRJJvdXjkmJhh9xU/aE1hNKo6TnuBxRbevVgL7L4ZajXF3Max3eLNXivP9T?=
 =?us-ascii?Q?sXF7eX8ZaSsi7J+/pI1DHNwO+Z+O8N6Spl1Z51lOAf0cqj/OXXJehiPvKly7?=
 =?us-ascii?Q?mob3y0n001hytMULKbsDX/6WyzKb/PYHtcl/4+u3so/XXb85xZ6d0u4H92A5?=
 =?us-ascii?Q?ZpTPVWBtwd9OJj+NPSriXNcxEbqFUZ/s0cyZNedmmq5/3pcIWLLrisdYDIzk?=
 =?us-ascii?Q?gcaRnFgCqZKGbURT0OFUobcVCSAsmnLFxZzVG15FrCj12tvfW91SRfF/ADU1?=
 =?us-ascii?Q?jyRVqFxfzzh2YjUBXwyQXoVmi4bQTv3FCtm4PpshPCF0WDQfR6092ZAf2SQN?=
 =?us-ascii?Q?hIb20fZXD/7VBqFtoDvYCbuEXr7XJn8MGNG1Kh6gEbHa23zrQipuDxJeFCRU?=
 =?us-ascii?Q?MAfjojbsvWP8ForrVT8644iqhWlB1fjwdM6nZlQSEjQUDAmjZILgFXZOzo4K?=
 =?us-ascii?Q?hJfFrOCSTIevP9PFb8aJA/9+RLI+SUGITR5mMot13tH9XkAbBu+me8iH4AnE?=
 =?us-ascii?Q?Hj5h2cBhREoCsW3R1j75an4vhEDL6o75peXLv64owaM4Hbk31hOeCGdKFkGQ?=
 =?us-ascii?Q?EDioVx5noF8MmYm9CxwekOhmh02c0SpHodh5kJFlLmAy39Zeb9EuPadGPfuY?=
 =?us-ascii?Q?gG8mpbkAkM2vH1r1lzFslVDSZ6rKZeQHh9kJN1eXpV8nF4lmHQ3NrVTuRq45?=
 =?us-ascii?Q?gwTNqfXqtSkpKLLM/NgOz2XjtI6lSHsfAuO0zgKocTfJAMyxdU9JHotFhXrj?=
 =?us-ascii?Q?GT+pQ+7cILg+jKR/Ocy1zd8FMAvWwDOr8eOn/QINS+jLvNr2OczBtp2UfHdv?=
 =?us-ascii?Q?6ZdtM0epntvZmPv5RsZ26t+fHHuBHUkRfKx+CTyWOq9F7yNC6vAiMA8Mb3/J?=
 =?us-ascii?Q?CC39L0ijnTmfp9h2bpVhysCoEwCuaGtXvg/C34W5HJkwJ0AzQi/xYdKtUTNl?=
 =?us-ascii?Q?V3pNzCI/8YqWykZ/kG0/FeGhR/qw3kPFSNJU3iXP52X9qRyOkOhnsFznvmwS?=
 =?us-ascii?Q?aeKuNSKKI1PFJ+N720MDOYb7i5g1jDRoS/taW4NnevMWHdCUCtwgesMOmavE?=
 =?us-ascii?Q?z4CRULY4EUflA/CZBI3FU87LOnaTv2P8D4Cs1rnslHzDswmRE/1g6fCeapF5?=
 =?us-ascii?Q?HyQhWUInnVpq1j/YgkCXa7hgvWLBPKVlHduHg19jQLXYryHnlJahitlusye9?=
 =?us-ascii?Q?NT1FC5JOdSReO2jrmnGBgJj6d688rjKl0TMsCoSkqbQOfSbZWlqp/zj7PMVD?=
 =?us-ascii?Q?+luzTil6GoyHWfWKj8dGIkpeLo6sfShdGJHFrCQ8jvAXpHX2cpTO92yzh3SO?=
 =?us-ascii?Q?CY7h3ZxCEj9pRBcmZM2TsUZ6srv6LJ/SMs001wqPdICNy9XQlHCuQhz2jmFE?=
 =?us-ascii?Q?M0Nhh7vUYznSDW8phacibDZ/Rz9Q5ter8MXdbD8S2OZENSDPcgkmmtnNc0hb?=
 =?us-ascii?Q?HMswuFhYElwz0J4Wo1OgopmnL06RY1rCmtskphWE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04736743-10de-432d-91d9-08db5e054be7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5979.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 16:21:45.0329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hg3hE6XzMRRjX204alVqRWEYGgUDbH9MpA/QTBAGgLzyvSqsB3Nc7ZFNDhyASWpp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359

Thu, May 25, 2023 at 09:30:34AM CEST, lkp@intel.com wrote:
>tree:   https://github.com/jpirko/linux_mlxsw combined_queue
>head:   c20070028226cf803fe67bc19dcf5ae0c84e07a6
>commit: 08e8f4e55f7aee913909d9f356380b45379545ff [1/84] devlink: introduce port ops placeholder
>config: i386-randconfig-i083-20230524
>compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
>reproduce (this is a W=1 build):
>        mkdir -p ~/bin
>        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        # https://github.com/jpirko/linux_mlxsw/commit/08e8f4e55f7aee913909d9f356380b45379545ff
>        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
>        git fetch --no-tags jpirko-mlxsw combined_queue
>        git checkout 08e8f4e55f7aee913909d9f356380b45379545ff
>        # save the config file
>        mkdir build_dir && cp config build_dir/.config
>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/devlink/
>
>If you fix the issue, kindly add following tag where applicable
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202305251552.RoYyyaZH-lkp@intel.com/
>
>All warnings (new ones prefixed by >>):
>
>>> net/devlink/leftover.c:6814: warning: expecting prototype for devl_port_register(). Prototype was for devl_port_register_with_ops() instead
>>> net/devlink/leftover.c:6858: warning: expecting prototype for devlink_port_register(). Prototype was for devlink_port_register_with_ops() instead

for the record, this is fixed in v2 I submitted couple hours ago.


>
>
>vim +6814 net/devlink/leftover.c
>
>ae3bbc04d4bfef net/core/devlink.c     Jiri Pirko      2022-09-29  6795  
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6796  /**
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6797   * devl_port_register() - Register devlink port
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6798   *
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6799   * @devlink: devlink
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6800   * @devlink_port: devlink port
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6801   * @port_index: driver-specific numerical identifier of the port
>08e8f4e55f7aee net/devlink/leftover.c Jiri Pirko      2023-05-24  6802   * @ops: port ops
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6803   *
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6804   * Register devlink port with provided port index. User can use
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6805   * any indexing, even hw-related one. devlink_port structure
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6806   * is convenient to be embedded inside user driver private structure.
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6807   * Note that the caller should take care of zeroing the devlink_port
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6808   * structure.
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6809   */
>08e8f4e55f7aee net/devlink/leftover.c Jiri Pirko      2023-05-24  6810  int devl_port_register_with_ops(struct devlink *devlink,
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6811  				struct devlink_port *devlink_port,
>08e8f4e55f7aee net/devlink/leftover.c Jiri Pirko      2023-05-24  6812  				unsigned int port_index,
>08e8f4e55f7aee net/devlink/leftover.c Jiri Pirko      2023-05-24  6813  				const struct devlink_port_ops *ops)
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14 @6814  {
>47b438cc27254f net/core/devlink.c     Jiri Pirko      2022-11-30  6815  	int err;
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6816  
>47b438cc27254f net/core/devlink.c     Jiri Pirko      2022-11-30  6817  	devl_assert_locked(devlink);
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6818  
>3fcb698d9c773d net/core/devlink.c     Jiri Pirko      2022-09-29  6819  	ASSERT_DEVLINK_PORT_NOT_REGISTERED(devlink_port);
>3fcb698d9c773d net/core/devlink.c     Jiri Pirko      2022-09-29  6820  
>ae3bbc04d4bfef net/core/devlink.c     Jiri Pirko      2022-09-29  6821  	devlink_port_init(devlink, devlink_port);
>081adcfe930e4b net/core/devlink.c     Jiri Pirko      2022-09-29  6822  	devlink_port->registered = true;
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6823  	devlink_port->index = port_index;
>08e8f4e55f7aee net/devlink/leftover.c Jiri Pirko      2023-05-24  6824  	devlink_port->ops = ops;
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6825  	spin_lock_init(&devlink_port->type_lock);
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6826  	INIT_LIST_HEAD(&devlink_port->reporter_list);
>47b438cc27254f net/core/devlink.c     Jiri Pirko      2022-11-30  6827  	err = xa_insert(&devlink->ports, port_index, devlink_port, GFP_KERNEL);
>1dea3b4e4c52f4 net/devlink/leftover.c Jiri Pirko      2023-01-18  6828  	if (err)
>47b438cc27254f net/core/devlink.c     Jiri Pirko      2022-11-30  6829  		return err;
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6830  
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6831  	INIT_DELAYED_WORK(&devlink_port->type_warn_dw, &devlink_port_type_warn);
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6832  	devlink_port_type_warn_schedule(devlink_port);
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6833  	devlink_port_notify(devlink_port, DEVLINK_CMD_PORT_NEW);
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6834  	return 0;
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6835  }
>08e8f4e55f7aee net/devlink/leftover.c Jiri Pirko      2023-05-24  6836  EXPORT_SYMBOL_GPL(devl_port_register_with_ops);
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6837  
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14  6838  /**
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14  6839   *	devlink_port_register - Register devlink port
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14  6840   *
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14  6841   *	@devlink: devlink
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14  6842   *	@devlink_port: devlink port
>eeaadd8285bf51 net/core/devlink.c     Jakub Kicinski  2019-02-27  6843   *	@port_index: driver-specific numerical identifier of the port
>08e8f4e55f7aee net/devlink/leftover.c Jiri Pirko      2023-05-24  6844   *	@ops: port ops
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14  6845   *
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14  6846   *	Register devlink port with provided port index. User can use
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14  6847   *	any indexing, even hw-related one. devlink_port structure
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14  6848   *	is convenient to be embedded inside user driver private structure.
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14  6849   *	Note that the caller should take care of zeroing the devlink_port
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14  6850   *	structure.
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6851   *
>1abfb265f0accc net/core/devlink.c     Jiri Pirko      2022-07-12  6852   *	Context: Takes and release devlink->lock <mutex>.
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14  6853   */
>08e8f4e55f7aee net/devlink/leftover.c Jiri Pirko      2023-05-24  6854  int devlink_port_register_with_ops(struct devlink *devlink,
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14  6855  				   struct devlink_port *devlink_port,
>08e8f4e55f7aee net/devlink/leftover.c Jiri Pirko      2023-05-24  6856  				   unsigned int port_index,
>08e8f4e55f7aee net/devlink/leftover.c Jiri Pirko      2023-05-24  6857  				   const struct devlink_port_ops *ops)
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14 @6858  {
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6859  	int err;
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6860  
>7715023aa51f2a net/core/devlink.c     Jiri Pirko      2022-07-12  6861  	devl_lock(devlink);
>08e8f4e55f7aee net/devlink/leftover.c Jiri Pirko      2023-05-24  6862  	err = devl_port_register_with_ops(devlink, devlink_port,
>08e8f4e55f7aee net/devlink/leftover.c Jiri Pirko      2023-05-24  6863  					  port_index, ops);
>7715023aa51f2a net/core/devlink.c     Jiri Pirko      2022-07-12  6864  	devl_unlock(devlink);
>2cb7b4890d6e7f net/core/devlink.c     Jakub Kicinski  2022-03-14  6865  	return err;
>bf7974710a40aa net/core/devlink.c     Jiri Pirko      2016-04-14  6866  }
>08e8f4e55f7aee net/devlink/leftover.c Jiri Pirko      2023-05-24  6867  EXPORT_SYMBOL_GPL(devlink_port_register_with_ops);
>d7907a2b1a3b89 net/core/devlink.c     Leon Romanovsky 2021-07-28  6868  
>
>:::::: The code at line 6814 was first introduced by commit
>:::::: 2cb7b4890d6e7f20560dc251e7f8d3cc68b0d554 devlink: expose instance locking and add locked port registering
>
>:::::: TO: Jakub Kicinski <kuba@kernel.org>
>:::::: CC: Jakub Kicinski <kuba@kernel.org>
>
>-- 
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki

>#
># Automatically generated file; DO NOT EDIT.
># Linux/i386 6.4.0-rc2 Kernel Configuration
>#
>CONFIG_CC_VERSION_TEXT="clang version 14.0.6 (git://gitmirror/llvm_project f28c006a5895fc0e329fe15fead81e37457cb1d1)"
>CONFIG_GCC_VERSION=0
>CONFIG_CC_IS_CLANG=y
>CONFIG_CLANG_VERSION=140006
>CONFIG_AS_IS_LLVM=y
>CONFIG_AS_VERSION=140006
>CONFIG_LD_VERSION=0
>CONFIG_LD_IS_LLD=y
>CONFIG_LLD_VERSION=140006
>CONFIG_RUST_IS_AVAILABLE=y
>CONFIG_CC_CAN_LINK=y
>CONFIG_CC_CAN_LINK_STATIC=y
>CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
>CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
>CONFIG_TOOLS_SUPPORT_RELR=y
>CONFIG_CC_HAS_ASM_INLINE=y
>CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
>CONFIG_PAHOLE_VERSION=125
>CONFIG_IRQ_WORK=y
>CONFIG_BUILDTIME_TABLE_SORT=y
>CONFIG_THREAD_INFO_IN_TASK=y
>
>#
># General setup
>#
>CONFIG_BROKEN_ON_SMP=y
>CONFIG_INIT_ENV_ARG_LIMIT=32
># CONFIG_COMPILE_TEST is not set
># CONFIG_WERROR is not set
>CONFIG_LOCALVERSION=""
>CONFIG_LOCALVERSION_AUTO=y
>CONFIG_BUILD_SALT=""
>CONFIG_HAVE_KERNEL_GZIP=y
>CONFIG_HAVE_KERNEL_BZIP2=y
>CONFIG_HAVE_KERNEL_LZMA=y
>CONFIG_HAVE_KERNEL_XZ=y
>CONFIG_HAVE_KERNEL_LZO=y
>CONFIG_HAVE_KERNEL_LZ4=y
>CONFIG_HAVE_KERNEL_ZSTD=y
># CONFIG_KERNEL_GZIP is not set
># CONFIG_KERNEL_BZIP2 is not set
>CONFIG_KERNEL_LZMA=y
># CONFIG_KERNEL_XZ is not set
># CONFIG_KERNEL_LZO is not set
># CONFIG_KERNEL_LZ4 is not set
># CONFIG_KERNEL_ZSTD is not set
>CONFIG_DEFAULT_INIT=""
>CONFIG_DEFAULT_HOSTNAME="(none)"
>CONFIG_SYSVIPC=y
>CONFIG_SYSVIPC_SYSCTL=y
># CONFIG_POSIX_MQUEUE is not set
># CONFIG_WATCH_QUEUE is not set
>CONFIG_CROSS_MEMORY_ATTACH=y
>CONFIG_USELIB=y
># CONFIG_AUDIT is not set
>CONFIG_HAVE_ARCH_AUDITSYSCALL=y
>
>#
># IRQ subsystem
>#
>CONFIG_GENERIC_IRQ_PROBE=y
>CONFIG_GENERIC_IRQ_SHOW=y
>CONFIG_HARDIRQS_SW_RESEND=y
>CONFIG_IRQ_DOMAIN=y
>CONFIG_IRQ_SIM=y
>CONFIG_IRQ_DOMAIN_HIERARCHY=y
>CONFIG_IRQ_MSI_IOMMU=y
>CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
>CONFIG_IRQ_FORCED_THREADING=y
>CONFIG_SPARSE_IRQ=y
># CONFIG_GENERIC_IRQ_DEBUGFS is not set
># end of IRQ subsystem
>
>CONFIG_CLOCKSOURCE_WATCHDOG=y
>CONFIG_ARCH_CLOCKSOURCE_INIT=y
>CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
>CONFIG_GENERIC_TIME_VSYSCALL=y
>CONFIG_GENERIC_CLOCKEVENTS=y
>CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
>CONFIG_GENERIC_CMOS_UPDATE=y
>CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
>
>#
># Timers subsystem
>#
>CONFIG_TICK_ONESHOT=y
>CONFIG_NO_HZ_COMMON=y
># CONFIG_HZ_PERIODIC is not set
>CONFIG_NO_HZ_IDLE=y
>CONFIG_NO_HZ=y
>CONFIG_HIGH_RES_TIMERS=y
>CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=100
># end of Timers subsystem
>
>CONFIG_BPF=y
>CONFIG_HAVE_EBPF_JIT=y
>
>#
># BPF subsystem
>#
>CONFIG_BPF_SYSCALL=y
># CONFIG_BPF_JIT is not set
>CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
># CONFIG_BPF_PRELOAD is not set
># end of BPF subsystem
>
>CONFIG_PREEMPT_VOLUNTARY_BUILD=y
># CONFIG_PREEMPT_NONE is not set
>CONFIG_PREEMPT_VOLUNTARY=y
># CONFIG_PREEMPT is not set
>CONFIG_PREEMPT_COUNT=y
># CONFIG_PREEMPT_DYNAMIC is not set
>
>#
># CPU/Task time and stats accounting
>#
>CONFIG_TICK_CPU_ACCOUNTING=y
>CONFIG_IRQ_TIME_ACCOUNTING=y
># CONFIG_BSD_PROCESS_ACCT is not set
>CONFIG_TASKSTATS=y
>CONFIG_TASK_DELAY_ACCT=y
># CONFIG_TASK_XACCT is not set
>CONFIG_PSI=y
># CONFIG_PSI_DEFAULT_DISABLED is not set
># end of CPU/Task time and stats accounting
>
>#
># RCU Subsystem
>#
>CONFIG_TINY_RCU=y
>CONFIG_RCU_EXPERT=y
>CONFIG_TINY_SRCU=y
>CONFIG_TASKS_RCU_GENERIC=y
>CONFIG_FORCE_TASKS_RCU=y
>CONFIG_TASKS_RCU=y
>CONFIG_FORCE_TASKS_RUDE_RCU=y
>CONFIG_TASKS_RUDE_RCU=y
>CONFIG_FORCE_TASKS_TRACE_RCU=y
>CONFIG_TASKS_TRACE_RCU=y
>CONFIG_RCU_NEED_SEGCBLIST=y
># CONFIG_TASKS_TRACE_RCU_READ_MB is not set
># end of RCU Subsystem
>
>CONFIG_IKCONFIG=y
>CONFIG_IKCONFIG_PROC=y
>CONFIG_IKHEADERS=y
>CONFIG_LOG_BUF_SHIFT=20
># CONFIG_PRINTK_INDEX is not set
>CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
>
>#
># Scheduler features
>#
># end of Scheduler features
>
>CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
>CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
>CONFIG_GCC11_NO_ARRAY_BOUNDS=y
>CONFIG_CGROUPS=y
>CONFIG_PAGE_COUNTER=y
>CONFIG_CGROUP_FAVOR_DYNMODS=y
>CONFIG_MEMCG=y
>CONFIG_MEMCG_KMEM=y
>CONFIG_CGROUP_SCHED=y
>CONFIG_FAIR_GROUP_SCHED=y
>CONFIG_CFS_BANDWIDTH=y
># CONFIG_RT_GROUP_SCHED is not set
># CONFIG_CGROUP_PIDS is not set
># CONFIG_CGROUP_RDMA is not set
># CONFIG_CGROUP_FREEZER is not set
># CONFIG_CGROUP_DEVICE is not set
>CONFIG_CGROUP_CPUACCT=y
>CONFIG_CGROUP_PERF=y
>CONFIG_CGROUP_BPF=y
># CONFIG_CGROUP_MISC is not set
># CONFIG_CGROUP_DEBUG is not set
>CONFIG_SOCK_CGROUP_DATA=y
># CONFIG_NAMESPACES is not set
>CONFIG_CHECKPOINT_RESTORE=y
>CONFIG_SCHED_AUTOGROUP=y
># CONFIG_RELAY is not set
>CONFIG_BLK_DEV_INITRD=y
>CONFIG_INITRAMFS_SOURCE=""
>CONFIG_RD_GZIP=y
># CONFIG_RD_BZIP2 is not set
># CONFIG_RD_LZMA is not set
># CONFIG_RD_XZ is not set
># CONFIG_RD_LZO is not set
>CONFIG_RD_LZ4=y
>CONFIG_RD_ZSTD=y
>CONFIG_BOOT_CONFIG=y
>CONFIG_BOOT_CONFIG_FORCE=y
>CONFIG_BOOT_CONFIG_EMBED=y
>CONFIG_BOOT_CONFIG_EMBED_FILE=""
># CONFIG_INITRAMFS_PRESERVE_MTIME is not set
>CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
># CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
>CONFIG_LD_ORPHAN_WARN=y
>CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
>CONFIG_SYSCTL=y
>CONFIG_HAVE_UID16=y
>CONFIG_SYSCTL_EXCEPTION_TRACE=y
>CONFIG_HAVE_PCSPKR_PLATFORM=y
>CONFIG_EXPERT=y
># CONFIG_UID16 is not set
>CONFIG_MULTIUSER=y
># CONFIG_SGETMASK_SYSCALL is not set
># CONFIG_SYSFS_SYSCALL is not set
>CONFIG_FHANDLE=y
># CONFIG_POSIX_TIMERS is not set
>CONFIG_PRINTK=y
>CONFIG_BUG=y
>CONFIG_ELF_CORE=y
>CONFIG_PCSPKR_PLATFORM=y
>CONFIG_BASE_FULL=y
>CONFIG_FUTEX=y
>CONFIG_FUTEX_PI=y
>CONFIG_EPOLL=y
>CONFIG_SIGNALFD=y
>CONFIG_TIMERFD=y
>CONFIG_EVENTFD=y
>CONFIG_SHMEM=y
># CONFIG_AIO is not set
># CONFIG_IO_URING is not set
># CONFIG_ADVISE_SYSCALLS is not set
>CONFIG_MEMBARRIER=y
>CONFIG_KALLSYMS=y
># CONFIG_KALLSYMS_SELFTEST is not set
>CONFIG_KALLSYMS_ALL=y
>CONFIG_KALLSYMS_BASE_RELATIVE=y
>CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
>CONFIG_KCMP=y
># CONFIG_RSEQ is not set
>CONFIG_EMBEDDED=y
>CONFIG_HAVE_PERF_EVENTS=y
>CONFIG_PERF_USE_VMALLOC=y
># CONFIG_PC104 is not set
>
>#
># Kernel Performance Events And Counters
>#
>CONFIG_PERF_EVENTS=y
>CONFIG_DEBUG_PERF_USE_VMALLOC=y
># end of Kernel Performance Events And Counters
>
># CONFIG_PROFILING is not set
>CONFIG_TRACEPOINTS=y
># end of General setup
>
>CONFIG_X86_32=y
>CONFIG_FORCE_DYNAMIC_FTRACE=y
>CONFIG_X86=y
>CONFIG_INSTRUCTION_DECODER=y
>CONFIG_OUTPUT_FORMAT="elf32-i386"
>CONFIG_LOCKDEP_SUPPORT=y
>CONFIG_STACKTRACE_SUPPORT=y
>CONFIG_MMU=y
>CONFIG_ARCH_MMAP_RND_BITS_MIN=8
>CONFIG_ARCH_MMAP_RND_BITS_MAX=16
>CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
>CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
>CONFIG_GENERIC_ISA_DMA=y
>CONFIG_GENERIC_BUG=y
>CONFIG_ARCH_MAY_HAVE_PC_FDC=y
>CONFIG_GENERIC_CALIBRATE_DELAY=y
>CONFIG_ARCH_HAS_CPU_RELAX=y
>CONFIG_ARCH_HIBERNATION_POSSIBLE=y
>CONFIG_ARCH_SUSPEND_POSSIBLE=y
>CONFIG_ARCH_SUPPORTS_UPROBES=y
>CONFIG_FIX_EARLYCON_MEM=y
>CONFIG_PGTABLE_LEVELS=2
>
>#
># Processor type and features
>#
># CONFIG_SMP is not set
>CONFIG_X86_FEATURE_NAMES=y
># CONFIG_GOLDFISH is not set
># CONFIG_X86_CPU_RESCTRL is not set
># CONFIG_X86_EXTENDED_PLATFORM is not set
># CONFIG_X86_INTEL_LPSS is not set
># CONFIG_X86_AMD_PLATFORM_DEVICE is not set
># CONFIG_IOSF_MBI is not set
>CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
>CONFIG_X86_32_IRIS=y
># CONFIG_SCHED_OMIT_FRAME_POINTER is not set
>CONFIG_HYPERVISOR_GUEST=y
>CONFIG_PARAVIRT=y
># CONFIG_PARAVIRT_DEBUG is not set
>CONFIG_X86_HV_CALLBACK_VECTOR=y
>CONFIG_KVM_GUEST=y
>CONFIG_ARCH_CPUIDLE_HALTPOLL=y
>CONFIG_PVH=y
># CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
>CONFIG_PARAVIRT_CLOCK=y
># CONFIG_M486SX is not set
># CONFIG_M486 is not set
># CONFIG_M586 is not set
># CONFIG_M586TSC is not set
># CONFIG_M586MMX is not set
># CONFIG_M686 is not set
># CONFIG_MPENTIUMII is not set
># CONFIG_MPENTIUMIII is not set
># CONFIG_MPENTIUMM is not set
># CONFIG_MPENTIUM4 is not set
># CONFIG_MK6 is not set
># CONFIG_MK7 is not set
># CONFIG_MK8 is not set
># CONFIG_MCRUSOE is not set
># CONFIG_MEFFICEON is not set
># CONFIG_MWINCHIPC6 is not set
># CONFIG_MWINCHIP3D is not set
># CONFIG_MELAN is not set
>CONFIG_MGEODEGX1=y
># CONFIG_MGEODE_LX is not set
># CONFIG_MCYRIXIII is not set
># CONFIG_MVIAC3_2 is not set
># CONFIG_MVIAC7 is not set
># CONFIG_MCORE2 is not set
># CONFIG_MATOM is not set
># CONFIG_X86_GENERIC is not set
>CONFIG_X86_INTERNODE_CACHE_SHIFT=4
>CONFIG_X86_L1_CACHE_SHIFT=4
>CONFIG_X86_ALIGNMENT_16=y
>CONFIG_X86_TSC=y
>CONFIG_X86_CMPXCHG64=y
>CONFIG_X86_MINIMUM_CPU_FAMILY=5
>CONFIG_X86_DEBUGCTLMSR=y
>CONFIG_IA32_FEAT_CTL=y
>CONFIG_X86_VMX_FEATURE_NAMES=y
>CONFIG_PROCESSOR_SELECT=y
>CONFIG_CPU_SUP_INTEL=y
># CONFIG_CPU_SUP_CYRIX_32 is not set
># CONFIG_CPU_SUP_AMD is not set
># CONFIG_CPU_SUP_HYGON is not set
># CONFIG_CPU_SUP_CENTAUR is not set
>CONFIG_CPU_SUP_TRANSMETA_32=y
>CONFIG_CPU_SUP_UMC_32=y
># CONFIG_CPU_SUP_ZHAOXIN is not set
>CONFIG_CPU_SUP_VORTEX_32=y
>CONFIG_HPET_TIMER=y
>CONFIG_DMI=y
>CONFIG_NR_CPUS_RANGE_BEGIN=1
>CONFIG_NR_CPUS_RANGE_END=1
>CONFIG_NR_CPUS_DEFAULT=1
>CONFIG_NR_CPUS=1
># CONFIG_X86_UP_APIC is not set
>CONFIG_X86_MCE=y
>CONFIG_X86_MCELOG_LEGACY=y
>CONFIG_X86_ANCIENT_MCE=y
>
>#
># Performance monitoring
>#
>CONFIG_PERF_EVENTS_INTEL_UNCORE=y
>CONFIG_PERF_EVENTS_INTEL_RAPL=y
>CONFIG_PERF_EVENTS_INTEL_CSTATE=y
># end of Performance monitoring
>
>CONFIG_X86_LEGACY_VM86=y
>CONFIG_VM86=y
># CONFIG_X86_IOPL_IOPERM is not set
>CONFIG_TOSHIBA=y
># CONFIG_X86_REBOOTFIXUPS is not set
># CONFIG_MICROCODE is not set
>CONFIG_X86_MSR=y
>CONFIG_X86_CPUID=y
># CONFIG_NOHIGHMEM is not set
>CONFIG_HIGHMEM4G=y
>CONFIG_VMSPLIT_3G=y
># CONFIG_VMSPLIT_3G_OPT is not set
># CONFIG_VMSPLIT_2G is not set
># CONFIG_VMSPLIT_2G_OPT is not set
># CONFIG_VMSPLIT_1G is not set
>CONFIG_PAGE_OFFSET=0xC0000000
>CONFIG_HIGHMEM=y
>CONFIG_X86_CPA_STATISTICS=y
>CONFIG_ARCH_FLATMEM_ENABLE=y
>CONFIG_ARCH_SPARSEMEM_ENABLE=y
>CONFIG_ARCH_SELECT_MEMORY_MODEL=y
>CONFIG_ILLEGAL_POINTER_VALUE=0
># CONFIG_HIGHPTE is not set
># CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
># CONFIG_MTRR is not set
>CONFIG_X86_UMIP=y
>CONFIG_CC_HAS_IBT=y
>CONFIG_X86_INTEL_TSX_MODE_OFF=y
># CONFIG_X86_INTEL_TSX_MODE_ON is not set
># CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
>CONFIG_EFI=y
># CONFIG_EFI_STUB is not set
># CONFIG_EFI_FAKE_MEMMAP is not set
># CONFIG_EFI_RUNTIME_MAP is not set
># CONFIG_HZ_100 is not set
># CONFIG_HZ_250 is not set
># CONFIG_HZ_300 is not set
>CONFIG_HZ_1000=y
>CONFIG_HZ=1000
>CONFIG_SCHED_HRTICK=y
>CONFIG_KEXEC=y
># CONFIG_CRASH_DUMP is not set
>CONFIG_PHYSICAL_START=0x1000000
># CONFIG_RELOCATABLE is not set
>CONFIG_PHYSICAL_ALIGN=0x200000
>CONFIG_COMPAT_VDSO=y
># CONFIG_CMDLINE_BOOL is not set
># CONFIG_MODIFY_LDT_SYSCALL is not set
># CONFIG_STRICT_SIGALTSTACK_SIZE is not set
># end of Processor type and features
>
>CONFIG_CC_HAS_ENTRY_PADDING=y
>CONFIG_FUNCTION_PADDING_CFI=11
>CONFIG_FUNCTION_PADDING_BYTES=16
>CONFIG_SPECULATION_MITIGATIONS=y
>CONFIG_RETPOLINE=y
>CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y
>
>#
># Power management and ACPI options
>#
>CONFIG_SUSPEND=y
>CONFIG_SUSPEND_FREEZER=y
>CONFIG_SUSPEND_SKIP_SYNC=y
>CONFIG_PM_SLEEP=y
># CONFIG_PM_AUTOSLEEP is not set
>CONFIG_PM_USERSPACE_AUTOSLEEP=y
># CONFIG_PM_WAKELOCKS is not set
>CONFIG_PM=y
># CONFIG_PM_DEBUG is not set
>CONFIG_PM_CLK=y
># CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
>CONFIG_ARCH_SUPPORTS_ACPI=y
>CONFIG_ACPI=y
>CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
>CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
>CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
># CONFIG_ACPI_DEBUGGER is not set
># CONFIG_ACPI_SPCR_TABLE is not set
>CONFIG_ACPI_SLEEP=y
>CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
>CONFIG_ACPI_EC_DEBUGFS=y
>CONFIG_ACPI_AC=y
>CONFIG_ACPI_BATTERY=y
>CONFIG_ACPI_BUTTON=y
># CONFIG_ACPI_VIDEO is not set
># CONFIG_ACPI_FAN is not set
>CONFIG_ACPI_TAD=y
>CONFIG_ACPI_DOCK=y
># CONFIG_ACPI_PROCESSOR is not set
>CONFIG_ACPI_CUSTOM_DSDT_FILE=""
>CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
>CONFIG_ACPI_TABLE_UPGRADE=y
>CONFIG_ACPI_DEBUG=y
># CONFIG_ACPI_PCI_SLOT is not set
>CONFIG_ACPI_CONTAINER=y
>CONFIG_ACPI_SBS=y
>CONFIG_ACPI_HED=y
># CONFIG_ACPI_CUSTOM_METHOD is not set
># CONFIG_ACPI_BGRT is not set
># CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
>CONFIG_HAVE_ACPI_APEI=y
>CONFIG_HAVE_ACPI_APEI_NMI=y
>CONFIG_ACPI_APEI=y
># CONFIG_ACPI_APEI_GHES is not set
>CONFIG_ACPI_APEI_EINJ=y
>CONFIG_ACPI_APEI_ERST_DEBUG=y
>CONFIG_ACPI_DPTF=y
>CONFIG_DPTF_POWER=y
># CONFIG_DPTF_PCH_FIVR is not set
>CONFIG_ACPI_CONFIGFS=y
># CONFIG_ACPI_FFH is not set
># CONFIG_PMIC_OPREGION is not set
>CONFIG_X86_PM_TIMER=y
>CONFIG_X86_APM_BOOT=y
>CONFIG_APM=y
>CONFIG_APM_IGNORE_USER_SUSPEND=y
>CONFIG_APM_DO_ENABLE=y
># CONFIG_APM_CPU_IDLE is not set
>CONFIG_APM_DISPLAY_BLANK=y
># CONFIG_APM_ALLOW_INTS is not set
>
>#
># CPU Frequency scaling
>#
># CONFIG_CPU_FREQ is not set
># end of CPU Frequency scaling
>
>#
># CPU Idle
>#
>CONFIG_CPU_IDLE=y
># CONFIG_CPU_IDLE_GOV_LADDER is not set
>CONFIG_CPU_IDLE_GOV_MENU=y
>CONFIG_CPU_IDLE_GOV_TEO=y
>CONFIG_CPU_IDLE_GOV_HALTPOLL=y
>CONFIG_HALTPOLL_CPUIDLE=y
># end of CPU Idle
>
># CONFIG_INTEL_IDLE is not set
># end of Power management and ACPI options
>
>#
># Bus options (PCI etc.)
>#
># CONFIG_PCI_GOBIOS is not set
># CONFIG_PCI_GOMMCONFIG is not set
># CONFIG_PCI_GODIRECT is not set
>CONFIG_PCI_GOANY=y
>CONFIG_PCI_BIOS=y
>CONFIG_PCI_DIRECT=y
>CONFIG_PCI_MMCONFIG=y
># CONFIG_PCI_CNB20LE_QUIRK is not set
>CONFIG_ISA_BUS=y
>CONFIG_ISA_DMA_API=y
>CONFIG_ISA=y
>CONFIG_SCx200=y
># CONFIG_SCx200HR_TIMER is not set
># CONFIG_OLPC is not set
># CONFIG_ALIX is not set
># CONFIG_NET5501 is not set
># CONFIG_GEOS is not set
># end of Bus options (PCI etc.)
>
>#
># Binary Emulations
>#
>CONFIG_COMPAT_32=y
># end of Binary Emulations
>
>CONFIG_HAVE_ATOMIC_IOMAP=y
>CONFIG_HAVE_KVM=y
># CONFIG_VIRTUALIZATION is not set
>CONFIG_AS_AVX512=y
>CONFIG_AS_SHA1_NI=y
>CONFIG_AS_SHA256_NI=y
>CONFIG_AS_TPAUSE=y
>CONFIG_AS_GFNI=y
>
>#
># General architecture-dependent options
>#
>CONFIG_CRASH_CORE=y
>CONFIG_KEXEC_CORE=y
>CONFIG_GENERIC_ENTRY=y
>CONFIG_KPROBES=y
># CONFIG_JUMP_LABEL is not set
># CONFIG_STATIC_CALL_SELFTEST is not set
>CONFIG_OPTPROBES=y
>CONFIG_KPROBES_ON_FTRACE=y
>CONFIG_UPROBES=y
>CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
>CONFIG_ARCH_USE_BUILTIN_BSWAP=y
>CONFIG_KRETPROBES=y
>CONFIG_KRETPROBE_ON_RETHOOK=y
>CONFIG_HAVE_IOREMAP_PROT=y
>CONFIG_HAVE_KPROBES=y
>CONFIG_HAVE_KRETPROBES=y
>CONFIG_HAVE_OPTPROBES=y
>CONFIG_HAVE_KPROBES_ON_FTRACE=y
>CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
>CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
>CONFIG_HAVE_NMI=y
>CONFIG_TRACE_IRQFLAGS_SUPPORT=y
>CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
>CONFIG_HAVE_ARCH_TRACEHOOK=y
>CONFIG_HAVE_DMA_CONTIGUOUS=y
>CONFIG_GENERIC_SMP_IDLE_THREAD=y
>CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
>CONFIG_ARCH_HAS_SET_MEMORY=y
>CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
>CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
>CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
>CONFIG_ARCH_WANTS_NO_INSTR=y
>CONFIG_ARCH_32BIT_OFF_T=y
>CONFIG_HAVE_ASM_MODVERSIONS=y
>CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
>CONFIG_HAVE_RSEQ=y
>CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
>CONFIG_HAVE_HW_BREAKPOINT=y
>CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
>CONFIG_HAVE_USER_RETURN_NOTIFIER=y
>CONFIG_HAVE_PERF_EVENTS_NMI=y
>CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
>CONFIG_HAVE_PERF_REGS=y
>CONFIG_HAVE_PERF_USER_STACK_DUMP=y
>CONFIG_HAVE_ARCH_JUMP_LABEL=y
>CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
>CONFIG_MMU_GATHER_TABLE_FREE=y
>CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
>CONFIG_MMU_GATHER_MERGE_VMAS=y
>CONFIG_MMU_LAZY_TLB_REFCOUNT=y
>CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
>CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
>CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
>CONFIG_HAVE_CMPXCHG_LOCAL=y
>CONFIG_HAVE_CMPXCHG_DOUBLE=y
>CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
>CONFIG_HAVE_ARCH_SECCOMP=y
>CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
># CONFIG_SECCOMP is not set
>CONFIG_HAVE_ARCH_STACKLEAK=y
>CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
>CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
>CONFIG_LTO_NONE=y
>CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
>CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
>CONFIG_HAVE_MOVE_PUD=y
>CONFIG_HAVE_MOVE_PMD=y
>CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
>CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
>CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
>CONFIG_MODULES_USE_ELF_REL=y
>CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
>CONFIG_SOFTIRQ_ON_OWN_STACK=y
>CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
>CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
>CONFIG_HAVE_EXIT_THREAD=y
>CONFIG_ARCH_MMAP_RND_BITS=8
>CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
>CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
>CONFIG_ISA_BUS_API=y
>CONFIG_CLONE_BACKWARDS=y
>CONFIG_OLD_SIGSUSPEND3=y
>CONFIG_OLD_SIGACTION=y
>CONFIG_COMPAT_32BIT_TIME=y
>CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
># CONFIG_RANDOMIZE_KSTACK_OFFSET is not set
>CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
>CONFIG_STRICT_KERNEL_RWX=y
>CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
>CONFIG_STRICT_MODULE_RWX=y
>CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
>CONFIG_ARCH_USE_MEMREMAP_PROT=y
>CONFIG_LOCK_EVENT_COUNTS=y
>CONFIG_ARCH_HAS_MEM_ENCRYPT=y
>CONFIG_HAVE_STATIC_CALL=y
>CONFIG_HAVE_PREEMPT_DYNAMIC=y
>CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
>CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
>CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
>CONFIG_ARCH_SPLIT_ARG64=y
>CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
>CONFIG_DYNAMIC_SIGFRAME=y
>
>#
># GCOV-based kernel profiling
>#
># CONFIG_GCOV_KERNEL is not set
>CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
># end of GCOV-based kernel profiling
>
>CONFIG_HAVE_GCC_PLUGINS=y
>CONFIG_FUNCTION_ALIGNMENT_4B=y
>CONFIG_FUNCTION_ALIGNMENT_16B=y
>CONFIG_FUNCTION_ALIGNMENT=16
># end of General architecture-dependent options
>
>CONFIG_RT_MUTEXES=y
>CONFIG_BASE_SMALL=0
>CONFIG_MODULES=y
># CONFIG_MODULE_DEBUG is not set
># CONFIG_MODULE_FORCE_LOAD is not set
>CONFIG_MODULE_UNLOAD=y
># CONFIG_MODULE_FORCE_UNLOAD is not set
># CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
># CONFIG_MODVERSIONS is not set
># CONFIG_MODULE_SRCVERSION_ALL is not set
># CONFIG_MODULE_SIG is not set
>CONFIG_MODULE_COMPRESS_NONE=y
># CONFIG_MODULE_COMPRESS_GZIP is not set
># CONFIG_MODULE_COMPRESS_XZ is not set
># CONFIG_MODULE_COMPRESS_ZSTD is not set
># CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
>CONFIG_MODPROBE_PATH="/sbin/modprobe"
># CONFIG_TRIM_UNUSED_KSYMS is not set
>CONFIG_MODULES_TREE_LOOKUP=y
># CONFIG_BLOCK is not set
>CONFIG_ASN1=y
>CONFIG_UNINLINE_SPIN_UNLOCK=y
>CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
>CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
>CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
>CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
>CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
>CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
>CONFIG_FREEZER=y
>
>#
># Executable file formats
>#
>CONFIG_BINFMT_ELF=y
>CONFIG_ELFCORE=y
># CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>CONFIG_BINFMT_SCRIPT=y
># CONFIG_BINFMT_MISC is not set
>CONFIG_COREDUMP=y
># end of Executable file formats
>
>#
># Memory Management options
>#
>
>#
># SLAB allocator options
>#
># CONFIG_SLAB is not set
>CONFIG_SLUB=y
># CONFIG_SLUB_TINY is not set
># CONFIG_SLAB_MERGE_DEFAULT is not set
>CONFIG_SLAB_FREELIST_RANDOM=y
># CONFIG_SLAB_FREELIST_HARDENED is not set
>CONFIG_SLUB_STATS=y
># end of SLAB allocator options
>
># CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
># CONFIG_COMPAT_BRK is not set
>CONFIG_SELECT_MEMORY_MODEL=y
>CONFIG_FLATMEM_MANUAL=y
># CONFIG_SPARSEMEM_MANUAL is not set
>CONFIG_FLATMEM=y
>CONFIG_SPARSEMEM_STATIC=y
>CONFIG_HAVE_FAST_GUP=y
>CONFIG_EXCLUSIVE_SYSTEM_RAM=y
>CONFIG_SPLIT_PTLOCK_CPUS=4
>CONFIG_COMPACTION=y
>CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
>CONFIG_PAGE_REPORTING=y
>CONFIG_MIGRATION=y
># CONFIG_KSM is not set
>CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
>CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
># CONFIG_MEMORY_FAILURE is not set
>CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
># CONFIG_TRANSPARENT_HUGEPAGE is not set
>CONFIG_NEED_PER_CPU_KM=y
>CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
>CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
>CONFIG_HAVE_SETUP_PER_CPU_AREA=y
># CONFIG_CMA is not set
>CONFIG_GENERIC_EARLY_IOREMAP=y
>CONFIG_PAGE_IDLE_FLAG=y
># CONFIG_IDLE_PAGE_TRACKING is not set
>CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
>CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
>CONFIG_ARCH_HAS_ZONE_DMA_SET=y
>CONFIG_ZONE_DMA=y
># CONFIG_VM_EVENT_COUNTERS is not set
>CONFIG_PERCPU_STATS=y
># CONFIG_GUP_TEST is not set
># CONFIG_DMAPOOL_TEST is not set
>CONFIG_ARCH_HAS_PTE_SPECIAL=y
>CONFIG_KMAP_LOCAL=y
>CONFIG_SECRETMEM=y
>CONFIG_USERFAULTFD=y
># CONFIG_LRU_GEN is not set
>
>#
># Data Access Monitoring
>#
>CONFIG_DAMON=y
># CONFIG_DAMON_VADDR is not set
>CONFIG_DAMON_PADDR=y
># CONFIG_DAMON_SYSFS is not set
>CONFIG_DAMON_RECLAIM=y
># CONFIG_DAMON_LRU_SORT is not set
># end of Data Access Monitoring
># end of Memory Management options
>
>CONFIG_NET=y
>CONFIG_NET_INGRESS=y
>CONFIG_NET_EGRESS=y
>CONFIG_SKB_EXTENSIONS=y
>
>#
># Networking options
>#
>CONFIG_PACKET=y
>CONFIG_PACKET_DIAG=y
>CONFIG_UNIX=y
>CONFIG_UNIX_SCM=y
>CONFIG_AF_UNIX_OOB=y
># CONFIG_UNIX_DIAG is not set
>CONFIG_TLS=y
># CONFIG_TLS_DEVICE is not set
>CONFIG_TLS_TOE=y
>CONFIG_XFRM=y
>CONFIG_XFRM_OFFLOAD=y
>CONFIG_XFRM_ALGO=y
># CONFIG_XFRM_USER is not set
>CONFIG_XFRM_SUB_POLICY=y
># CONFIG_XFRM_MIGRATE is not set
># CONFIG_XFRM_STATISTICS is not set
>CONFIG_XFRM_AH=y
>CONFIG_XFRM_ESP=y
>CONFIG_XFRM_IPCOMP=y
>CONFIG_NET_KEY=y
># CONFIG_NET_KEY_MIGRATE is not set
>CONFIG_SMC=y
>CONFIG_SMC_DIAG=y
>CONFIG_XDP_SOCKETS=y
>CONFIG_XDP_SOCKETS_DIAG=y
>CONFIG_INET=y
>CONFIG_IP_MULTICAST=y
># CONFIG_IP_ADVANCED_ROUTER is not set
>CONFIG_IP_ROUTE_CLASSID=y
>CONFIG_IP_PNP=y
>CONFIG_IP_PNP_DHCP=y
># CONFIG_IP_PNP_BOOTP is not set
># CONFIG_IP_PNP_RARP is not set
>CONFIG_NET_IPIP=y
>CONFIG_NET_IPGRE_DEMUX=y
>CONFIG_NET_IP_TUNNEL=y
># CONFIG_NET_IPGRE is not set
># CONFIG_IP_MROUTE is not set
>CONFIG_SYN_COOKIES=y
># CONFIG_NET_IPVTI is not set
>CONFIG_NET_UDP_TUNNEL=y
>CONFIG_NET_FOU=y
># CONFIG_NET_FOU_IP_TUNNELS is not set
>CONFIG_INET_AH=y
>CONFIG_INET_ESP=y
>CONFIG_INET_ESP_OFFLOAD=y
># CONFIG_INET_ESPINTCP is not set
>CONFIG_INET_IPCOMP=y
>CONFIG_INET_TABLE_PERTURB_ORDER=16
>CONFIG_INET_XFRM_TUNNEL=y
>CONFIG_INET_TUNNEL=y
>CONFIG_INET_DIAG=y
>CONFIG_INET_TCP_DIAG=y
>CONFIG_INET_UDP_DIAG=y
>CONFIG_INET_RAW_DIAG=y
># CONFIG_INET_DIAG_DESTROY is not set
># CONFIG_TCP_CONG_ADVANCED is not set
>CONFIG_TCP_CONG_CUBIC=y
>CONFIG_DEFAULT_TCP_CONG="cubic"
>CONFIG_TCP_MD5SIG=y
># CONFIG_IPV6 is not set
># CONFIG_NETLABEL is not set
># CONFIG_MPTCP is not set
># CONFIG_NETWORK_SECMARK is not set
># CONFIG_NETWORK_PHY_TIMESTAMPING is not set
>CONFIG_NETFILTER=y
># CONFIG_NETFILTER_ADVANCED is not set
>
>#
># Core Netfilter Configuration
>#
>CONFIG_NETFILTER_INGRESS=y
>CONFIG_NETFILTER_EGRESS=y
>CONFIG_NETFILTER_SKIP_EGRESS=y
>CONFIG_NETFILTER_NETLINK=y
>CONFIG_NETFILTER_FAMILY_BRIDGE=y
>CONFIG_NETFILTER_BPF_LINK=y
># CONFIG_NETFILTER_NETLINK_LOG is not set
># CONFIG_NF_CONNTRACK is not set
>CONFIG_NF_LOG_SYSLOG=y
># CONFIG_NF_TABLES is not set
>CONFIG_NETFILTER_XTABLES=y
>
>#
># Xtables combined modules
>#
>CONFIG_NETFILTER_XT_MARK=y
>
>#
># Xtables targets
>#
>CONFIG_NETFILTER_XT_TARGET_LOG=y
># CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
>CONFIG_NETFILTER_XT_TARGET_TCPMSS=y
>
>#
># Xtables matches
>#
># CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
>CONFIG_NETFILTER_XT_MATCH_POLICY=y
># end of Core Netfilter Configuration
>
>CONFIG_IP_SET=y
>CONFIG_IP_SET_MAX=256
># CONFIG_IP_SET_BITMAP_IP is not set
>CONFIG_IP_SET_BITMAP_IPMAC=y
>CONFIG_IP_SET_BITMAP_PORT=y
># CONFIG_IP_SET_HASH_IP is not set
>CONFIG_IP_SET_HASH_IPMARK=y
># CONFIG_IP_SET_HASH_IPPORT is not set
>CONFIG_IP_SET_HASH_IPPORTIP=y
>CONFIG_IP_SET_HASH_IPPORTNET=y
># CONFIG_IP_SET_HASH_IPMAC is not set
># CONFIG_IP_SET_HASH_MAC is not set
># CONFIG_IP_SET_HASH_NETPORTNET is not set
>CONFIG_IP_SET_HASH_NET=y
># CONFIG_IP_SET_HASH_NETNET is not set
># CONFIG_IP_SET_HASH_NETPORT is not set
>CONFIG_IP_SET_HASH_NETIFACE=y
># CONFIG_IP_SET_LIST_SET is not set
>CONFIG_IP_VS=y
>CONFIG_IP_VS_DEBUG=y
>CONFIG_IP_VS_TAB_BITS=12
>
>#
># IPVS transport protocol load balancing support
>#
># CONFIG_IP_VS_PROTO_TCP is not set
># CONFIG_IP_VS_PROTO_UDP is not set
>CONFIG_IP_VS_PROTO_AH_ESP=y
>CONFIG_IP_VS_PROTO_ESP=y
># CONFIG_IP_VS_PROTO_AH is not set
>CONFIG_IP_VS_PROTO_SCTP=y
>
>#
># IPVS scheduler
>#
># CONFIG_IP_VS_RR is not set
>CONFIG_IP_VS_WRR=y
># CONFIG_IP_VS_LC is not set
># CONFIG_IP_VS_WLC is not set
>CONFIG_IP_VS_FO=y
># CONFIG_IP_VS_OVF is not set
>CONFIG_IP_VS_LBLC=y
>CONFIG_IP_VS_LBLCR=y
>CONFIG_IP_VS_DH=y
># CONFIG_IP_VS_SH is not set
># CONFIG_IP_VS_MH is not set
># CONFIG_IP_VS_SED is not set
># CONFIG_IP_VS_NQ is not set
># CONFIG_IP_VS_TWOS is not set
>
>#
># IPVS SH scheduler
>#
>CONFIG_IP_VS_SH_TAB_BITS=8
>
>#
># IPVS MH scheduler
>#
>CONFIG_IP_VS_MH_TAB_INDEX=12
>
>#
># IPVS application helper
>#
>
>#
># IP: Netfilter Configuration
>#
>CONFIG_NF_SOCKET_IPV4=y
>CONFIG_NF_TPROXY_IPV4=y
>CONFIG_NF_DUP_IPV4=y
># CONFIG_NF_LOG_ARP is not set
># CONFIG_NF_LOG_IPV4 is not set
>CONFIG_NF_REJECT_IPV4=y
>CONFIG_IP_NF_IPTABLES=y
>CONFIG_IP_NF_FILTER=y
>CONFIG_IP_NF_TARGET_REJECT=y
>CONFIG_IP_NF_MANGLE=y
>CONFIG_IP_NF_RAW=y
># end of IP: Netfilter Configuration
>
>CONFIG_BRIDGE_NF_EBTABLES=y
># CONFIG_BRIDGE_EBT_BROUTE is not set
>CONFIG_BRIDGE_EBT_T_FILTER=y
># CONFIG_BRIDGE_EBT_T_NAT is not set
># CONFIG_BRIDGE_EBT_802_3 is not set
>CONFIG_BRIDGE_EBT_AMONG=y
>CONFIG_BRIDGE_EBT_ARP=y
>CONFIG_BRIDGE_EBT_IP=y
># CONFIG_BRIDGE_EBT_LIMIT is not set
>CONFIG_BRIDGE_EBT_MARK=y
>CONFIG_BRIDGE_EBT_PKTTYPE=y
># CONFIG_BRIDGE_EBT_STP is not set
># CONFIG_BRIDGE_EBT_VLAN is not set
># CONFIG_BRIDGE_EBT_ARPREPLY is not set
># CONFIG_BRIDGE_EBT_DNAT is not set
>CONFIG_BRIDGE_EBT_MARK_T=y
># CONFIG_BRIDGE_EBT_REDIRECT is not set
>CONFIG_BRIDGE_EBT_SNAT=y
>CONFIG_BRIDGE_EBT_LOG=y
># CONFIG_BRIDGE_EBT_NFLOG is not set
># CONFIG_BPFILTER is not set
>CONFIG_IP_DCCP=y
>CONFIG_INET_DCCP_DIAG=y
>
>#
># DCCP CCIDs Configuration
>#
># CONFIG_IP_DCCP_CCID2_DEBUG is not set
># CONFIG_IP_DCCP_CCID3 is not set
># end of DCCP CCIDs Configuration
>
>#
># DCCP Kernel Hacking
>#
>CONFIG_IP_DCCP_DEBUG=y
># end of DCCP Kernel Hacking
>
># CONFIG_IP_SCTP is not set
>CONFIG_RDS=y
># CONFIG_RDS_TCP is not set
># CONFIG_RDS_DEBUG is not set
>CONFIG_TIPC=y
># CONFIG_TIPC_MEDIA_UDP is not set
># CONFIG_TIPC_CRYPTO is not set
>CONFIG_TIPC_DIAG=y
>CONFIG_ATM=y
># CONFIG_ATM_CLIP is not set
>CONFIG_ATM_LANE=y
># CONFIG_ATM_MPOA is not set
># CONFIG_ATM_BR2684 is not set
># CONFIG_L2TP is not set
>CONFIG_STP=y
>CONFIG_BRIDGE=y
># CONFIG_BRIDGE_IGMP_SNOOPING is not set
>CONFIG_BRIDGE_VLAN_FILTERING=y
># CONFIG_BRIDGE_MRP is not set
>CONFIG_BRIDGE_CFM=y
># CONFIG_NET_DSA is not set
>CONFIG_VLAN_8021Q=y
># CONFIG_VLAN_8021Q_GVRP is not set
># CONFIG_VLAN_8021Q_MVRP is not set
>CONFIG_LLC=y
># CONFIG_LLC2 is not set
>CONFIG_ATALK=y
># CONFIG_DEV_APPLETALK is not set
>CONFIG_X25=y
>CONFIG_LAPB=y
>CONFIG_PHONET=y
># CONFIG_IEEE802154 is not set
>CONFIG_NET_SCHED=y
>
>#
># Queueing/Scheduling
>#
>CONFIG_NET_SCH_HTB=y
>CONFIG_NET_SCH_HFSC=y
># CONFIG_NET_SCH_PRIO is not set
># CONFIG_NET_SCH_MULTIQ is not set
># CONFIG_NET_SCH_RED is not set
>CONFIG_NET_SCH_SFB=y
>CONFIG_NET_SCH_SFQ=y
># CONFIG_NET_SCH_TEQL is not set
># CONFIG_NET_SCH_TBF is not set
>CONFIG_NET_SCH_CBS=y
># CONFIG_NET_SCH_ETF is not set
>CONFIG_NET_SCH_MQPRIO_LIB=y
>CONFIG_NET_SCH_TAPRIO=y
>CONFIG_NET_SCH_GRED=y
>CONFIG_NET_SCH_NETEM=y
># CONFIG_NET_SCH_DRR is not set
>CONFIG_NET_SCH_MQPRIO=y
># CONFIG_NET_SCH_SKBPRIO is not set
>CONFIG_NET_SCH_CHOKE=y
>CONFIG_NET_SCH_QFQ=y
># CONFIG_NET_SCH_CODEL is not set
># CONFIG_NET_SCH_FQ_CODEL is not set
># CONFIG_NET_SCH_CAKE is not set
># CONFIG_NET_SCH_FQ is not set
>CONFIG_NET_SCH_HHF=y
>CONFIG_NET_SCH_PIE=y
># CONFIG_NET_SCH_FQ_PIE is not set
>CONFIG_NET_SCH_INGRESS=y
>CONFIG_NET_SCH_PLUG=y
>CONFIG_NET_SCH_ETS=y
>CONFIG_NET_SCH_DEFAULT=y
># CONFIG_DEFAULT_SFQ is not set
>CONFIG_DEFAULT_PFIFO_FAST=y
>CONFIG_DEFAULT_NET_SCH="pfifo_fast"
>
>#
># Classification
>#
>CONFIG_NET_CLS=y
># CONFIG_NET_CLS_BASIC is not set
>CONFIG_NET_CLS_ROUTE4=y
># CONFIG_NET_CLS_FW is not set
># CONFIG_NET_CLS_U32 is not set
># CONFIG_NET_CLS_FLOW is not set
>CONFIG_NET_CLS_CGROUP=y
># CONFIG_NET_CLS_BPF is not set
># CONFIG_NET_CLS_FLOWER is not set
>CONFIG_NET_CLS_MATCHALL=y
>CONFIG_NET_EMATCH=y
>CONFIG_NET_EMATCH_STACK=32
># CONFIG_NET_EMATCH_CMP is not set
>CONFIG_NET_EMATCH_NBYTE=y
>CONFIG_NET_EMATCH_U32=y
># CONFIG_NET_EMATCH_META is not set
>CONFIG_NET_EMATCH_TEXT=y
>CONFIG_NET_EMATCH_CANID=y
># CONFIG_NET_EMATCH_IPSET is not set
># CONFIG_NET_EMATCH_IPT is not set
>CONFIG_NET_CLS_ACT=y
>CONFIG_NET_ACT_POLICE=y
># CONFIG_NET_ACT_GACT is not set
># CONFIG_NET_ACT_MIRRED is not set
>CONFIG_NET_ACT_SAMPLE=y
>CONFIG_NET_ACT_IPT=y
># CONFIG_NET_ACT_NAT is not set
># CONFIG_NET_ACT_PEDIT is not set
>CONFIG_NET_ACT_SIMP=y
># CONFIG_NET_ACT_SKBEDIT is not set
># CONFIG_NET_ACT_CSUM is not set
># CONFIG_NET_ACT_MPLS is not set
>CONFIG_NET_ACT_VLAN=y
>CONFIG_NET_ACT_BPF=y
># CONFIG_NET_ACT_SKBMOD is not set
>CONFIG_NET_ACT_IFE=y
>CONFIG_NET_ACT_TUNNEL_KEY=y
>CONFIG_NET_ACT_GATE=y
>CONFIG_NET_IFE_SKBMARK=y
>CONFIG_NET_IFE_SKBPRIO=y
># CONFIG_NET_IFE_SKBTCINDEX is not set
>CONFIG_NET_TC_SKB_EXT=y
>CONFIG_NET_SCH_FIFO=y
># CONFIG_DCB is not set
>CONFIG_DNS_RESOLVER=y
># CONFIG_BATMAN_ADV is not set
>CONFIG_OPENVSWITCH=y
># CONFIG_VSOCKETS is not set
># CONFIG_NETLINK_DIAG is not set
>CONFIG_MPLS=y
>CONFIG_NET_MPLS_GSO=y
># CONFIG_MPLS_ROUTING is not set
>CONFIG_NET_NSH=y
># CONFIG_HSR is not set
># CONFIG_NET_SWITCHDEV is not set
>CONFIG_NET_L3_MASTER_DEV=y
># CONFIG_QRTR is not set
>CONFIG_NET_NCSI=y
># CONFIG_NCSI_OEM_CMD_GET_MAC is not set
>CONFIG_NCSI_OEM_CMD_KEEP_PHY=y
>CONFIG_MAX_SKB_FRAGS=17
># CONFIG_CGROUP_NET_PRIO is not set
>CONFIG_CGROUP_NET_CLASSID=y
>CONFIG_NET_RX_BUSY_POLL=y
>CONFIG_BQL=y
>CONFIG_BPF_STREAM_PARSER=y
>
>#
># Network testing
>#
>CONFIG_NET_PKTGEN=y
>CONFIG_NET_DROP_MONITOR=y
># end of Network testing
># end of Networking options
>
>CONFIG_HAMRADIO=y
>
>#
># Packet Radio protocols
>#
># CONFIG_AX25 is not set
>CONFIG_CAN=y
># CONFIG_CAN_RAW is not set
>CONFIG_CAN_BCM=y
>CONFIG_CAN_GW=y
># CONFIG_CAN_J1939 is not set
>CONFIG_CAN_ISOTP=y
>CONFIG_BT=y
># CONFIG_BT_BREDR is not set
># CONFIG_BT_LE is not set
>CONFIG_BT_LEDS=y
># CONFIG_BT_MSFTEXT is not set
>CONFIG_BT_AOSPEXT=y
>CONFIG_BT_DEBUGFS=y
># CONFIG_BT_SELFTEST is not set
># CONFIG_BT_FEATURE_DEBUG is not set
>
>#
># Bluetooth device drivers
>#
>CONFIG_BT_MTK=y
>CONFIG_BT_HCIBTSDIO=y
># CONFIG_BT_HCIUART is not set
># CONFIG_BT_HCIBCM4377 is not set
># CONFIG_BT_HCIVHCI is not set
>CONFIG_BT_MRVL=y
>CONFIG_BT_MRVL_SDIO=y
>CONFIG_BT_MTKSDIO=y
>CONFIG_BT_VIRTIO=y
># end of Bluetooth device drivers
>
>CONFIG_AF_RXRPC=y
># CONFIG_AF_RXRPC_INJECT_LOSS is not set
># CONFIG_AF_RXRPC_INJECT_RX_DELAY is not set
># CONFIG_AF_RXRPC_DEBUG is not set
>CONFIG_RXKAD=y
># CONFIG_RXPERF is not set
># CONFIG_AF_KCM is not set
>CONFIG_STREAM_PARSER=y
># CONFIG_MCTP is not set
># CONFIG_WIRELESS is not set
># CONFIG_RFKILL is not set
>CONFIG_NET_9P=y
>CONFIG_NET_9P_FD=y
>CONFIG_NET_9P_VIRTIO=y
># CONFIG_NET_9P_DEBUG is not set
># CONFIG_CAIF is not set
>CONFIG_CEPH_LIB=y
># CONFIG_CEPH_LIB_PRETTYDEBUG is not set
>CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
># CONFIG_NFC is not set
>CONFIG_PSAMPLE=y
>CONFIG_NET_IFE=y
># CONFIG_LWTUNNEL is not set
>CONFIG_DST_CACHE=y
>CONFIG_GRO_CELLS=y
>CONFIG_NET_SELFTESTS=y
>CONFIG_NET_SOCK_MSG=y
>CONFIG_NET_DEVLINK=y
>CONFIG_PAGE_POOL=y
>CONFIG_PAGE_POOL_STATS=y
>CONFIG_FAILOVER=y
>CONFIG_ETHTOOL_NETLINK=y
>
>#
># Device Drivers
>#
>CONFIG_HAVE_EISA=y
># CONFIG_EISA is not set
>CONFIG_HAVE_PCI=y
>CONFIG_PCI=y
>CONFIG_PCI_DOMAINS=y
># CONFIG_PCIEPORTBUS is not set
>CONFIG_PCIEASPM=y
>CONFIG_PCIEASPM_DEFAULT=y
># CONFIG_PCIEASPM_POWERSAVE is not set
># CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
># CONFIG_PCIEASPM_PERFORMANCE is not set
># CONFIG_PCIE_PTM is not set
># CONFIG_PCI_MSI is not set
>CONFIG_PCI_QUIRKS=y
># CONFIG_PCI_DEBUG is not set
># CONFIG_PCI_STUB is not set
>CONFIG_PCI_LOCKLESS_CONFIG=y
># CONFIG_PCI_IOV is not set
># CONFIG_PCI_PRI is not set
># CONFIG_PCI_PASID is not set
>CONFIG_PCI_LABEL=y
># CONFIG_PCIE_BUS_TUNE_OFF is not set
>CONFIG_PCIE_BUS_DEFAULT=y
># CONFIG_PCIE_BUS_SAFE is not set
># CONFIG_PCIE_BUS_PERFORMANCE is not set
># CONFIG_PCIE_BUS_PEER2PEER is not set
>CONFIG_VGA_ARB=y
>CONFIG_VGA_ARB_MAX_GPUS=16
># CONFIG_HOTPLUG_PCI is not set
>
>#
># PCI controller drivers
>#
># CONFIG_PCI_FTPCI100 is not set
># CONFIG_PCI_HOST_GENERIC is not set
>
>#
># Cadence-based PCIe controllers
>#
># CONFIG_PCIE_CADENCE_PLAT_HOST is not set
># CONFIG_PCI_J721E_HOST is not set
># end of Cadence-based PCIe controllers
>
>#
># DesignWare-based PCIe controllers
>#
># end of DesignWare-based PCIe controllers
>
>#
># Mobiveil-based PCIe controllers
>#
># end of Mobiveil-based PCIe controllers
># end of PCI controller drivers
>
>#
># PCI Endpoint
>#
># CONFIG_PCI_ENDPOINT is not set
># end of PCI Endpoint
>
>#
># PCI switch controller drivers
>#
># CONFIG_PCI_SW_SWITCHTEC is not set
># end of PCI switch controller drivers
>
># CONFIG_CXL_BUS is not set
># CONFIG_PCCARD is not set
># CONFIG_RAPIDIO is not set
>
>#
># Generic Driver Options
>#
>CONFIG_AUXILIARY_BUS=y
># CONFIG_UEVENT_HELPER is not set
>CONFIG_DEVTMPFS=y
># CONFIG_DEVTMPFS_MOUNT is not set
># CONFIG_DEVTMPFS_SAFE is not set
># CONFIG_STANDALONE is not set
># CONFIG_PREVENT_FIRMWARE_BUILD is not set
>
>#
># Firmware loader
>#
>CONFIG_FW_LOADER=y
>CONFIG_FW_LOADER_PAGED_BUF=y
>CONFIG_FW_LOADER_SYSFS=y
>CONFIG_EXTRA_FIRMWARE=""
>CONFIG_FW_LOADER_USER_HELPER=y
># CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
># CONFIG_FW_LOADER_COMPRESS is not set
>CONFIG_FW_CACHE=y
># CONFIG_FW_UPLOAD is not set
># end of Firmware loader
>
>CONFIG_WANT_DEV_COREDUMP=y
># CONFIG_ALLOW_DEV_COREDUMP is not set
># CONFIG_DEBUG_DRIVER is not set
>CONFIG_DEBUG_DEVRES=y
># CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
># CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
>CONFIG_GENERIC_CPU_AUTOPROBE=y
>CONFIG_GENERIC_CPU_VULNERABILITIES=y
>CONFIG_REGMAP=y
>CONFIG_REGMAP_I2C=y
>CONFIG_REGMAP_SLIMBUS=y
>CONFIG_REGMAP_SPMI=y
>CONFIG_REGMAP_W1=y
>CONFIG_REGMAP_MMIO=y
>CONFIG_REGMAP_IRQ=y
>CONFIG_DMA_SHARED_BUFFER=y
># CONFIG_DMA_FENCE_TRACE is not set
># CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
># end of Generic Driver Options
>
>#
># Bus devices
>#
>CONFIG_MHI_BUS=y
># CONFIG_MHI_BUS_DEBUG is not set
># CONFIG_MHI_BUS_PCI_GENERIC is not set
># CONFIG_MHI_BUS_EP is not set
># end of Bus devices
>
>CONFIG_CONNECTOR=y
># CONFIG_PROC_EVENTS is not set
>
>#
># Firmware Drivers
>#
>
>#
># ARM System Control and Management Interface Protocol
>#
># end of ARM System Control and Management Interface Protocol
>
>CONFIG_EDD=y
># CONFIG_EDD_OFF is not set
>CONFIG_FIRMWARE_MEMMAP=y
># CONFIG_DMIID is not set
>CONFIG_DMI_SYSFS=y
>CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
>CONFIG_FW_CFG_SYSFS=y
>CONFIG_FW_CFG_SYSFS_CMDLINE=y
># CONFIG_SYSFB_SIMPLEFB is not set
># CONFIG_GOOGLE_FIRMWARE is not set
>
>#
># EFI (Extensible Firmware Interface) Support
>#
>CONFIG_EFI_ESRT=y
>CONFIG_EFI_VARS_PSTORE=y
>CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
>CONFIG_EFI_RUNTIME_WRAPPERS=y
>CONFIG_EFI_BOOTLOADER_CONTROL=y
>CONFIG_EFI_CAPSULE_LOADER=y
>CONFIG_EFI_CAPSULE_QUIRK_QUARK_CSH=y
># CONFIG_EFI_TEST is not set
># CONFIG_EFI_RCI2_TABLE is not set
>CONFIG_EFI_DISABLE_PCI_DMA=y
>CONFIG_EFI_EARLYCON=y
># CONFIG_EFI_CUSTOM_SSDT_OVERLAYS is not set
># CONFIG_EFI_DISABLE_RUNTIME is not set
>CONFIG_EFI_COCO_SECRET=y
># end of EFI (Extensible Firmware Interface) Support
>
>CONFIG_UEFI_CPER=y
>CONFIG_UEFI_CPER_X86=y
>
>#
># Tegra firmware driver
>#
># end of Tegra firmware driver
># end of Firmware Drivers
>
># CONFIG_GNSS is not set
>CONFIG_MTD=y
># CONFIG_MTD_TESTS is not set
>
>#
># Partition parsers
>#
>CONFIG_MTD_AR7_PARTS=y
>CONFIG_MTD_CMDLINE_PARTS=y
>CONFIG_MTD_OF_PARTS=y
>CONFIG_MTD_REDBOOT_PARTS=y
>CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
># CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
>CONFIG_MTD_REDBOOT_PARTS_READONLY=y
># end of Partition parsers
>
>#
># User Modules And Translation Layers
>#
>CONFIG_MTD_OOPS=y
>CONFIG_MTD_PARTITIONED_MASTER=y
>
>#
># RAM/ROM/Flash chip drivers
>#
># CONFIG_MTD_CFI is not set
>CONFIG_MTD_JEDECPROBE=y
>CONFIG_MTD_GEN_PROBE=y
># CONFIG_MTD_CFI_ADV_OPTIONS is not set
>CONFIG_MTD_MAP_BANK_WIDTH_1=y
>CONFIG_MTD_MAP_BANK_WIDTH_2=y
>CONFIG_MTD_MAP_BANK_WIDTH_4=y
>CONFIG_MTD_CFI_I1=y
>CONFIG_MTD_CFI_I2=y
># CONFIG_MTD_CFI_INTELEXT is not set
># CONFIG_MTD_CFI_AMDSTD is not set
># CONFIG_MTD_CFI_STAA is not set
>CONFIG_MTD_CFI_UTIL=y
># CONFIG_MTD_RAM is not set
>CONFIG_MTD_ROM=y
># CONFIG_MTD_ABSENT is not set
># end of RAM/ROM/Flash chip drivers
>
>#
># Mapping drivers for chip access
>#
># CONFIG_MTD_COMPLEX_MAPPINGS is not set
>CONFIG_MTD_PHYSMAP=y
>CONFIG_MTD_PHYSMAP_COMPAT=y
>CONFIG_MTD_PHYSMAP_START=0x8000000
>CONFIG_MTD_PHYSMAP_LEN=0
>CONFIG_MTD_PHYSMAP_BANKWIDTH=2
># CONFIG_MTD_PHYSMAP_OF is not set
># CONFIG_MTD_AMD76XROM is not set
>CONFIG_MTD_ICHXROM=y
># CONFIG_MTD_ESB2ROM is not set
># CONFIG_MTD_CK804XROM is not set
># CONFIG_MTD_SCB2_FLASH is not set
># CONFIG_MTD_NETtel is not set
># CONFIG_MTD_L440GX is not set
># CONFIG_MTD_INTEL_VR_NOR is not set
># CONFIG_MTD_PLATRAM is not set
># end of Mapping drivers for chip access
>
>#
># Self-contained MTD device drivers
>#
># CONFIG_MTD_PMC551 is not set
>CONFIG_MTD_SLRAM=y
>CONFIG_MTD_PHRAM=y
>CONFIG_MTD_MTDRAM=y
>CONFIG_MTDRAM_TOTAL_SIZE=4096
>CONFIG_MTDRAM_ERASE_SIZE=128
>
>#
># Disk-On-Chip Device Drivers
>#
>CONFIG_MTD_DOCG3=y
>CONFIG_BCH_CONST_M=14
>CONFIG_BCH_CONST_T=4
># end of Self-contained MTD device drivers
>
>#
># NAND
>#
>CONFIG_MTD_NAND_CORE=y
>CONFIG_MTD_ONENAND=y
>CONFIG_MTD_ONENAND_VERIFY_WRITE=y
>CONFIG_MTD_ONENAND_GENERIC=y
>CONFIG_MTD_ONENAND_OTP=y
>CONFIG_MTD_ONENAND_2X_PROGRAM=y
>CONFIG_MTD_RAW_NAND=y
>
>#
># Raw/parallel NAND flash controllers
>#
>CONFIG_MTD_NAND_DENALI=y
># CONFIG_MTD_NAND_DENALI_PCI is not set
>CONFIG_MTD_NAND_DENALI_DT=y
># CONFIG_MTD_NAND_CAFE is not set
># CONFIG_MTD_NAND_CS553X is not set
># CONFIG_MTD_NAND_MXIC is not set
># CONFIG_MTD_NAND_GPIO is not set
>CONFIG_MTD_NAND_PLATFORM=y
># CONFIG_MTD_NAND_CADENCE is not set
># CONFIG_MTD_NAND_ARASAN is not set
>CONFIG_MTD_NAND_INTEL_LGM=y
>
>#
># Misc
>#
># CONFIG_MTD_NAND_NANDSIM is not set
># CONFIG_MTD_NAND_RICOH is not set
>CONFIG_MTD_NAND_DISKONCHIP=y
>CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=y
>CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
># CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH is not set
>CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y
>
>#
># ECC engine support
>#
>CONFIG_MTD_NAND_ECC=y
># CONFIG_MTD_NAND_ECC_SW_HAMMING is not set
>CONFIG_MTD_NAND_ECC_SW_BCH=y
>CONFIG_MTD_NAND_ECC_MXIC=y
># end of ECC engine support
># end of NAND
>
>#
># LPDDR & LPDDR2 PCM memory drivers
>#
># CONFIG_MTD_LPDDR is not set
># end of LPDDR & LPDDR2 PCM memory drivers
>
>CONFIG_MTD_UBI=y
>CONFIG_MTD_UBI_WL_THRESHOLD=4096
>CONFIG_MTD_UBI_BEB_LIMIT=20
>CONFIG_MTD_UBI_FASTMAP=y
>CONFIG_MTD_UBI_GLUEBI=y
># CONFIG_MTD_HYPERBUS is not set
>CONFIG_DTC=y
>CONFIG_OF=y
># CONFIG_OF_UNITTEST is not set
>CONFIG_OF_FLATTREE=y
>CONFIG_OF_EARLY_FLATTREE=y
>CONFIG_OF_KOBJ=y
>CONFIG_OF_DYNAMIC=y
>CONFIG_OF_ADDRESS=y
>CONFIG_OF_IRQ=y
>CONFIG_OF_RESERVED_MEM=y
>CONFIG_OF_RESOLVE=y
>CONFIG_OF_OVERLAY=y
>CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
># CONFIG_PARPORT is not set
>CONFIG_PNP=y
># CONFIG_PNP_DEBUG_MESSAGES is not set
>
>#
># Protocols
>#
>CONFIG_ISAPNP=y
>CONFIG_PNPBIOS=y
>CONFIG_PNPBIOS_PROC_FS=y
>CONFIG_PNPACPI=y
>
>#
># NVME Support
>#
># end of NVME Support
>
>#
># Misc devices
>#
>CONFIG_AD525X_DPOT=y
>CONFIG_AD525X_DPOT_I2C=y
># CONFIG_DUMMY_IRQ is not set
># CONFIG_IBM_ASM is not set
># CONFIG_PHANTOM is not set
># CONFIG_TIFM_CORE is not set
>CONFIG_ICS932S401=y
># CONFIG_ENCLOSURE_SERVICES is not set
>CONFIG_HI6421V600_IRQ=y
># CONFIG_HP_ILO is not set
># CONFIG_APDS9802ALS is not set
>CONFIG_ISL29003=y
>CONFIG_ISL29020=y
>CONFIG_SENSORS_TSL2550=y
># CONFIG_SENSORS_BH1770 is not set
>CONFIG_SENSORS_APDS990X=y
>CONFIG_HMC6352=y
>CONFIG_DS1682=y
># CONFIG_PCH_PHUB is not set
>CONFIG_SRAM=y
># CONFIG_DW_XDATA_PCIE is not set
># CONFIG_PCI_ENDPOINT_TEST is not set
>CONFIG_XILINX_SDFEC=y
>CONFIG_OPEN_DICE=y
># CONFIG_VCPU_STALL_DETECTOR is not set
># CONFIG_C2PORT is not set
>
>#
># EEPROM support
>#
>CONFIG_EEPROM_AT24=y
>CONFIG_EEPROM_LEGACY=y
># CONFIG_EEPROM_MAX6875 is not set
>CONFIG_EEPROM_93CX6=y
>CONFIG_EEPROM_IDT_89HPESX=y
>CONFIG_EEPROM_EE1004=y
># end of EEPROM support
>
># CONFIG_CB710_CORE is not set
>
>#
># Texas Instruments shared transport line discipline
>#
># CONFIG_TI_ST is not set
># end of Texas Instruments shared transport line discipline
>
># CONFIG_SENSORS_LIS3_I2C is not set
># CONFIG_ALTERA_STAPL is not set
># CONFIG_INTEL_MEI is not set
># CONFIG_INTEL_MEI_ME is not set
># CONFIG_INTEL_MEI_TXE is not set
># CONFIG_VMWARE_VMCI is not set
>CONFIG_ECHO=y
># CONFIG_MISC_ALCOR_PCI is not set
># CONFIG_MISC_RTSX_PCI is not set
>CONFIG_UACCE=y
>CONFIG_PVPANIC=y
>CONFIG_PVPANIC_MMIO=y
># CONFIG_PVPANIC_PCI is not set
># CONFIG_GP_PCI1XXXX is not set
># end of Misc devices
>
>#
># SCSI device support
>#
># end of SCSI device support
>
># CONFIG_FUSION is not set
>
>#
># IEEE 1394 (FireWire) support
>#
>CONFIG_FIREWIRE=y
># CONFIG_FIREWIRE_OHCI is not set
>CONFIG_FIREWIRE_NET=y
># CONFIG_FIREWIRE_NOSY is not set
># end of IEEE 1394 (FireWire) support
>
>CONFIG_MACINTOSH_DRIVERS=y
># CONFIG_MAC_EMUMOUSEBTN is not set
>CONFIG_NETDEVICES=y
>CONFIG_MII=y
># CONFIG_NET_CORE is not set
>CONFIG_ARCNET=y
>CONFIG_ARCNET_1201=y
>CONFIG_ARCNET_1051=y
># CONFIG_ARCNET_RAW is not set
>CONFIG_ARCNET_CAP=y
>CONFIG_ARCNET_COM90xx=y
>CONFIG_ARCNET_COM90xxIO=y
># CONFIG_ARCNET_RIM_I is not set
>CONFIG_ARCNET_COM20020=y
>CONFIG_ARCNET_COM20020_ISA=y
># CONFIG_ARCNET_COM20020_PCI is not set
># CONFIG_ATM_DRIVERS is not set
>CONFIG_ETHERNET=y
># CONFIG_NET_VENDOR_3COM is not set
>CONFIG_NET_VENDOR_ADAPTEC=y
># CONFIG_ADAPTEC_STARFIRE is not set
>CONFIG_NET_VENDOR_AGERE=y
># CONFIG_ET131X is not set
>CONFIG_NET_VENDOR_ALACRITECH=y
># CONFIG_SLICOSS is not set
>CONFIG_NET_VENDOR_ALTEON=y
># CONFIG_ACENIC is not set
>CONFIG_ALTERA_TSE=y
>CONFIG_NET_VENDOR_AMAZON=y
># CONFIG_NET_VENDOR_AMD is not set
>CONFIG_NET_VENDOR_AQUANTIA=y
># CONFIG_AQTION is not set
># CONFIG_NET_VENDOR_ARC is not set
>CONFIG_NET_VENDOR_ASIX=y
>CONFIG_NET_VENDOR_ATHEROS=y
># CONFIG_ATL2 is not set
># CONFIG_ATL1 is not set
># CONFIG_ATL1E is not set
># CONFIG_ATL1C is not set
># CONFIG_ALX is not set
># CONFIG_CX_ECAT is not set
># CONFIG_NET_VENDOR_BROADCOM is not set
>CONFIG_NET_VENDOR_CADENCE=y
>CONFIG_MACB=y
># CONFIG_MACB_PCI is not set
># CONFIG_NET_VENDOR_CAVIUM is not set
>CONFIG_NET_VENDOR_CHELSIO=y
># CONFIG_CHELSIO_T1 is not set
># CONFIG_CHELSIO_T3 is not set
># CONFIG_CHELSIO_T4 is not set
># CONFIG_CHELSIO_T4VF is not set
># CONFIG_NET_VENDOR_CIRRUS is not set
>CONFIG_NET_VENDOR_CISCO=y
># CONFIG_ENIC is not set
>CONFIG_NET_VENDOR_CORTINA=y
>CONFIG_GEMINI_ETHERNET=y
>CONFIG_NET_VENDOR_DAVICOM=y
>CONFIG_DNET=y
>CONFIG_NET_VENDOR_DEC=y
># CONFIG_NET_TULIP is not set
>CONFIG_NET_VENDOR_DLINK=y
># CONFIG_DL2K is not set
># CONFIG_SUNDANCE is not set
>CONFIG_NET_VENDOR_EMULEX=y
># CONFIG_BE2NET is not set
># CONFIG_NET_VENDOR_ENGLEDER is not set
>CONFIG_NET_VENDOR_EZCHIP=y
># CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
># CONFIG_NET_VENDOR_FUNGIBLE is not set
>CONFIG_NET_VENDOR_GOOGLE=y
># CONFIG_NET_VENDOR_HUAWEI is not set
>CONFIG_NET_VENDOR_I825XX=y
>CONFIG_NET_VENDOR_INTEL=y
># CONFIG_E100 is not set
>CONFIG_E1000=y
># CONFIG_E1000E is not set
># CONFIG_IGB is not set
># CONFIG_IGBVF is not set
># CONFIG_IXGBE is not set
># CONFIG_I40E is not set
># CONFIG_IGC is not set
># CONFIG_JME is not set
># CONFIG_NET_VENDOR_LITEX is not set
># CONFIG_NET_VENDOR_MARVELL is not set
># CONFIG_NET_VENDOR_MELLANOX is not set
>CONFIG_NET_VENDOR_MICREL=y
>CONFIG_KS8842=y
># CONFIG_KS8851_MLL is not set
># CONFIG_KSZ884X_PCI is not set
># CONFIG_NET_VENDOR_MICROCHIP is not set
>CONFIG_NET_VENDOR_MICROSEMI=y
># CONFIG_NET_VENDOR_MICROSOFT is not set
>CONFIG_NET_VENDOR_MYRI=y
># CONFIG_MYRI10GE is not set
># CONFIG_FEALNX is not set
># CONFIG_NET_VENDOR_NI is not set
>CONFIG_NET_VENDOR_NATSEMI=y
># CONFIG_NATSEMI is not set
># CONFIG_NS83820 is not set
>CONFIG_NET_VENDOR_NETERION=y
># CONFIG_S2IO is not set
>CONFIG_NET_VENDOR_NETRONOME=y
># CONFIG_NET_VENDOR_8390 is not set
>CONFIG_NET_VENDOR_NVIDIA=y
># CONFIG_FORCEDETH is not set
>CONFIG_NET_VENDOR_OKI=y
># CONFIG_ETHOC is not set
>CONFIG_NET_VENDOR_PACKET_ENGINES=y
># CONFIG_HAMACHI is not set
># CONFIG_YELLOWFIN is not set
>CONFIG_NET_VENDOR_PENSANDO=y
>CONFIG_NET_VENDOR_QLOGIC=y
># CONFIG_QLA3XXX is not set
># CONFIG_QLCNIC is not set
># CONFIG_NETXEN_NIC is not set
># CONFIG_QED is not set
>CONFIG_NET_VENDOR_BROCADE=y
># CONFIG_BNA is not set
># CONFIG_NET_VENDOR_QUALCOMM is not set
>CONFIG_NET_VENDOR_RDC=y
># CONFIG_R6040 is not set
>CONFIG_NET_VENDOR_REALTEK=y
># CONFIG_8139CP is not set
># CONFIG_8139TOO is not set
># CONFIG_R8169 is not set
>CONFIG_NET_VENDOR_RENESAS=y
># CONFIG_NET_VENDOR_ROCKER is not set
>CONFIG_NET_VENDOR_SAMSUNG=y
>CONFIG_SXGBE_ETH=y
>CONFIG_NET_VENDOR_SEEQ=y
>CONFIG_NET_VENDOR_SILAN=y
># CONFIG_SC92031 is not set
>CONFIG_NET_VENDOR_SIS=y
># CONFIG_SIS900 is not set
># CONFIG_SIS190 is not set
># CONFIG_NET_VENDOR_SOLARFLARE is not set
># CONFIG_NET_VENDOR_SMSC is not set
># CONFIG_NET_VENDOR_SOCIONEXT is not set
>CONFIG_NET_VENDOR_STMICRO=y
>CONFIG_STMMAC_ETH=y
># CONFIG_STMMAC_SELFTESTS is not set
>CONFIG_STMMAC_PLATFORM=y
>CONFIG_DWMAC_DWC_QOS_ETH=y
>CONFIG_DWMAC_GENERIC=y
># CONFIG_DWMAC_INTEL_PLAT is not set
>CONFIG_DWMAC_INTEL=y
># CONFIG_DWMAC_LOONGSON is not set
># CONFIG_STMMAC_PCI is not set
>CONFIG_NET_VENDOR_SUN=y
># CONFIG_HAPPYMEAL is not set
># CONFIG_SUNGEM is not set
># CONFIG_CASSINI is not set
># CONFIG_NIU is not set
>CONFIG_NET_VENDOR_SYNOPSYS=y
>CONFIG_DWC_XLGMAC=y
># CONFIG_DWC_XLGMAC_PCI is not set
>CONFIG_NET_VENDOR_TEHUTI=y
># CONFIG_TEHUTI is not set
>CONFIG_NET_VENDOR_TI=y
># CONFIG_TI_CPSW_PHY_SEL is not set
># CONFIG_TLAN is not set
>CONFIG_NET_VENDOR_VERTEXCOM=y
>CONFIG_NET_VENDOR_VIA=y
># CONFIG_VIA_RHINE is not set
>CONFIG_VIA_VELOCITY=y
>CONFIG_NET_VENDOR_WANGXUN=y
># CONFIG_NGBE is not set
># CONFIG_TXGBE is not set
>CONFIG_NET_VENDOR_WIZNET=y
># CONFIG_WIZNET_W5100 is not set
># CONFIG_WIZNET_W5300 is not set
># CONFIG_NET_VENDOR_XILINX is not set
># CONFIG_FDDI is not set
># CONFIG_HIPPI is not set
># CONFIG_NET_SB1000 is not set
>CONFIG_PHYLINK=y
>CONFIG_PHYLIB=y
>CONFIG_SWPHY=y
># CONFIG_LED_TRIGGER_PHY is not set
>CONFIG_PHYLIB_LEDS=y
>CONFIG_FIXED_PHY=y
># CONFIG_SFP is not set
>
>#
># MII PHY device drivers
>#
># CONFIG_AMD_PHY is not set
>CONFIG_ADIN_PHY=y
># CONFIG_ADIN1100_PHY is not set
>CONFIG_AQUANTIA_PHY=y
>CONFIG_AX88796B_PHY=y
>CONFIG_BROADCOM_PHY=y
>CONFIG_BCM54140_PHY=y
>CONFIG_BCM7XXX_PHY=y
>CONFIG_BCM84881_PHY=y
>CONFIG_BCM87XX_PHY=y
>CONFIG_BCM_NET_PHYLIB=y
>CONFIG_CICADA_PHY=y
>CONFIG_CORTINA_PHY=y
>CONFIG_DAVICOM_PHY=y
>CONFIG_ICPLUS_PHY=y
>CONFIG_LXT_PHY=y
># CONFIG_INTEL_XWAY_PHY is not set
># CONFIG_LSI_ET1011C_PHY is not set
># CONFIG_MARVELL_PHY is not set
>CONFIG_MARVELL_10G_PHY=y
># CONFIG_MARVELL_88X2222_PHY is not set
>CONFIG_MAXLINEAR_GPHY=y
>CONFIG_MEDIATEK_GE_PHY=y
>CONFIG_MICREL_PHY=y
># CONFIG_MICROCHIP_T1S_PHY is not set
># CONFIG_MICROCHIP_PHY is not set
>CONFIG_MICROCHIP_T1_PHY=y
># CONFIG_MICROSEMI_PHY is not set
>CONFIG_MOTORCOMM_PHY=y
># CONFIG_NATIONAL_PHY is not set
># CONFIG_NXP_CBTX_PHY is not set
>CONFIG_NXP_C45_TJA11XX_PHY=y
>CONFIG_NXP_TJA11XX_PHY=y
># CONFIG_NCN26000_PHY is not set
># CONFIG_AT803X_PHY is not set
># CONFIG_QSEMI_PHY is not set
>CONFIG_REALTEK_PHY=y
>CONFIG_RENESAS_PHY=y
>CONFIG_ROCKCHIP_PHY=y
>CONFIG_SMSC_PHY=y
>CONFIG_STE10XP=y
>CONFIG_TERANETICS_PHY=y
>CONFIG_DP83822_PHY=y
>CONFIG_DP83TC811_PHY=y
>CONFIG_DP83848_PHY=y
>CONFIG_DP83867_PHY=y
># CONFIG_DP83869_PHY is not set
>CONFIG_DP83TD510_PHY=y
>CONFIG_VITESSE_PHY=y
># CONFIG_XILINX_GMII2RGMII is not set
># CONFIG_PSE_CONTROLLER is not set
>CONFIG_CAN_DEV=y
>CONFIG_CAN_VCAN=y
># CONFIG_CAN_VXCAN is not set
>CONFIG_CAN_NETLINK=y
>CONFIG_CAN_CALC_BITTIMING=y
>CONFIG_CAN_RX_OFFLOAD=y
># CONFIG_CAN_CAN327 is not set
># CONFIG_CAN_FLEXCAN is not set
># CONFIG_CAN_GRCAN is not set
># CONFIG_CAN_KVASER_PCIEFD is not set
># CONFIG_CAN_SLCAN is not set
>CONFIG_CAN_C_CAN=y
>CONFIG_CAN_C_CAN_PLATFORM=y
># CONFIG_CAN_C_CAN_PCI is not set
># CONFIG_CAN_CC770 is not set
>CONFIG_CAN_CTUCANFD=y
># CONFIG_CAN_CTUCANFD_PCI is not set
>CONFIG_CAN_CTUCANFD_PLATFORM=y
># CONFIG_CAN_IFI_CANFD is not set
>CONFIG_CAN_M_CAN=y
># CONFIG_CAN_M_CAN_PCI is not set
># CONFIG_CAN_M_CAN_PLATFORM is not set
># CONFIG_CAN_PEAK_PCIEFD is not set
>CONFIG_CAN_SJA1000=y
># CONFIG_CAN_EMS_PCI is not set
># CONFIG_CAN_F81601 is not set
># CONFIG_CAN_KVASER_PCI is not set
># CONFIG_CAN_PEAK_PCI is not set
># CONFIG_CAN_PLX_PCI is not set
>CONFIG_CAN_SJA1000_ISA=y
># CONFIG_CAN_SJA1000_PLATFORM is not set
>CONFIG_CAN_TSCAN1=y
>CONFIG_CAN_SOFTING=y
># CONFIG_CAN_DEBUG_DEVICES is not set
>CONFIG_MDIO_DEVICE=y
>CONFIG_MDIO_BUS=y
>CONFIG_FWNODE_MDIO=y
>CONFIG_OF_MDIO=y
>CONFIG_ACPI_MDIO=y
>CONFIG_MDIO_DEVRES=y
>CONFIG_MDIO_BITBANG=y
># CONFIG_MDIO_BCM_UNIMAC is not set
># CONFIG_MDIO_GPIO is not set
>CONFIG_MDIO_HISI_FEMAC=y
>CONFIG_MDIO_MSCC_MIIM=y
>CONFIG_MDIO_IPQ4019=y
># CONFIG_MDIO_IPQ8064 is not set
>
>#
># MDIO Multiplexers
>#
>CONFIG_MDIO_BUS_MUX=y
>CONFIG_MDIO_BUS_MUX_GPIO=y
>CONFIG_MDIO_BUS_MUX_MULTIPLEXER=y
>CONFIG_MDIO_BUS_MUX_MMIOREG=y
>
>#
># PCS device drivers
>#
>CONFIG_PCS_XPCS=y
>CONFIG_PCS_ALTERA_TSE=y
># end of PCS device drivers
>
>CONFIG_PPP=y
># CONFIG_PPP_BSDCOMP is not set
>CONFIG_PPP_DEFLATE=y
>CONFIG_PPP_FILTER=y
>CONFIG_PPP_MPPE=y
># CONFIG_PPP_MULTILINK is not set
>CONFIG_PPPOATM=y
>CONFIG_PPPOE=y
># CONFIG_PPPOE_HASH_BITS_2 is not set
>CONFIG_PPPOE_HASH_BITS_4=y
># CONFIG_PPPOE_HASH_BITS_8 is not set
>CONFIG_PPPOE_HASH_BITS=4
># CONFIG_PPTP is not set
># CONFIG_PPP_ASYNC is not set
># CONFIG_PPP_SYNC_TTY is not set
># CONFIG_SLIP is not set
>CONFIG_SLHC=y
>
>#
># Host-side USB support is needed for USB Network Adapter support
>#
># CONFIG_WLAN is not set
># CONFIG_WAN is not set
>
>#
># Wireless WAN
>#
>CONFIG_WWAN=y
># CONFIG_WWAN_DEBUGFS is not set
>CONFIG_WWAN_HWSIM=y
># CONFIG_MHI_WWAN_CTRL is not set
># CONFIG_MHI_WWAN_MBIM is not set
>CONFIG_RPMSG_WWAN_CTRL=y
># CONFIG_IOSM is not set
># CONFIG_MTK_T7XX is not set
># end of Wireless WAN
>
># CONFIG_VMXNET3 is not set
>CONFIG_FUJITSU_ES=y
>CONFIG_NETDEVSIM=y
># CONFIG_NET_FAILOVER is not set
># CONFIG_ISDN is not set
>
>#
># Input device support
>#
>CONFIG_INPUT=y
>CONFIG_INPUT_LEDS=y
># CONFIG_INPUT_FF_MEMLESS is not set
>CONFIG_INPUT_SPARSEKMAP=m
># CONFIG_INPUT_MATRIXKMAP is not set
>CONFIG_INPUT_VIVALDIFMAP=y
>
>#
># Userland interfaces
>#
># CONFIG_INPUT_MOUSEDEV is not set
># CONFIG_INPUT_JOYDEV is not set
># CONFIG_INPUT_EVDEV is not set
># CONFIG_INPUT_EVBUG is not set
>
>#
># Input Device Drivers
>#
>CONFIG_INPUT_KEYBOARD=y
># CONFIG_KEYBOARD_ADP5588 is not set
># CONFIG_KEYBOARD_ADP5589 is not set
>CONFIG_KEYBOARD_ATKBD=y
># CONFIG_KEYBOARD_QT1050 is not set
># CONFIG_KEYBOARD_QT1070 is not set
># CONFIG_KEYBOARD_QT2160 is not set
># CONFIG_KEYBOARD_DLINK_DIR685 is not set
># CONFIG_KEYBOARD_LKKBD is not set
># CONFIG_KEYBOARD_GPIO is not set
># CONFIG_KEYBOARD_GPIO_POLLED is not set
># CONFIG_KEYBOARD_TCA6416 is not set
># CONFIG_KEYBOARD_TCA8418 is not set
># CONFIG_KEYBOARD_MATRIX is not set
># CONFIG_KEYBOARD_LM8323 is not set
># CONFIG_KEYBOARD_LM8333 is not set
># CONFIG_KEYBOARD_MAX7359 is not set
># CONFIG_KEYBOARD_MCS is not set
># CONFIG_KEYBOARD_MPR121 is not set
># CONFIG_KEYBOARD_NEWTON is not set
># CONFIG_KEYBOARD_OPENCORES is not set
># CONFIG_KEYBOARD_PINEPHONE is not set
># CONFIG_KEYBOARD_SAMSUNG is not set
># CONFIG_KEYBOARD_STOWAWAY is not set
># CONFIG_KEYBOARD_SUNKBD is not set
># CONFIG_KEYBOARD_IQS62X is not set
># CONFIG_KEYBOARD_OMAP4 is not set
># CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
># CONFIG_KEYBOARD_XTKBD is not set
># CONFIG_KEYBOARD_CROS_EC is not set
># CONFIG_KEYBOARD_CAP11XX is not set
># CONFIG_KEYBOARD_BCM is not set
># CONFIG_KEYBOARD_MTK_PMIC is not set
># CONFIG_KEYBOARD_CYPRESS_SF is not set
>CONFIG_INPUT_MOUSE=y
>CONFIG_MOUSE_PS2=y
>CONFIG_MOUSE_PS2_ALPS=y
>CONFIG_MOUSE_PS2_BYD=y
>CONFIG_MOUSE_PS2_LOGIPS2PP=y
>CONFIG_MOUSE_PS2_SYNAPTICS=y
>CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
>CONFIG_MOUSE_PS2_CYPRESS=y
>CONFIG_MOUSE_PS2_LIFEBOOK=y
>CONFIG_MOUSE_PS2_TRACKPOINT=y
># CONFIG_MOUSE_PS2_ELANTECH is not set
># CONFIG_MOUSE_PS2_SENTELIC is not set
># CONFIG_MOUSE_PS2_TOUCHKIT is not set
>CONFIG_MOUSE_PS2_FOCALTECH=y
># CONFIG_MOUSE_PS2_VMMOUSE is not set
>CONFIG_MOUSE_PS2_SMBUS=y
># CONFIG_MOUSE_SERIAL is not set
># CONFIG_MOUSE_APPLETOUCH is not set
># CONFIG_MOUSE_BCM5974 is not set
># CONFIG_MOUSE_CYAPA is not set
># CONFIG_MOUSE_ELAN_I2C is not set
># CONFIG_MOUSE_INPORT is not set
># CONFIG_MOUSE_LOGIBM is not set
># CONFIG_MOUSE_PC110PAD is not set
># CONFIG_MOUSE_VSXXXAA is not set
># CONFIG_MOUSE_GPIO is not set
># CONFIG_MOUSE_SYNAPTICS_I2C is not set
># CONFIG_MOUSE_SYNAPTICS_USB is not set
># CONFIG_INPUT_JOYSTICK is not set
># CONFIG_INPUT_TABLET is not set
># CONFIG_INPUT_TOUCHSCREEN is not set
># CONFIG_INPUT_MISC is not set
># CONFIG_RMI4_CORE is not set
>
>#
># Hardware I/O ports
>#
>CONFIG_SERIO=y
>CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
>CONFIG_SERIO_I8042=y
>CONFIG_SERIO_SERPORT=y
># CONFIG_SERIO_CT82C710 is not set
># CONFIG_SERIO_PCIPS2 is not set
>CONFIG_SERIO_LIBPS2=y
># CONFIG_SERIO_RAW is not set
># CONFIG_SERIO_ALTERA_PS2 is not set
>CONFIG_SERIO_PS2MULT=y
>CONFIG_SERIO_ARC_PS2=y
># CONFIG_SERIO_APBPS2 is not set
>CONFIG_SERIO_GPIO_PS2=y
>CONFIG_USERIO=y
># CONFIG_GAMEPORT is not set
># end of Hardware I/O ports
># end of Input device support
>
>#
># Character devices
>#
>CONFIG_TTY=y
># CONFIG_VT is not set
>CONFIG_UNIX98_PTYS=y
>CONFIG_LEGACY_PTYS=y
>CONFIG_LEGACY_PTY_COUNT=256
>CONFIG_LEGACY_TIOCSTI=y
>CONFIG_LDISC_AUTOLOAD=y
>
>#
># Serial drivers
>#
>CONFIG_SERIAL_EARLYCON=y
>CONFIG_SERIAL_8250=y
>CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
>CONFIG_SERIAL_8250_PNP=y
># CONFIG_SERIAL_8250_16550A_VARIANTS is not set
># CONFIG_SERIAL_8250_FINTEK is not set
>CONFIG_SERIAL_8250_CONSOLE=y
>CONFIG_SERIAL_8250_DMA=y
>CONFIG_SERIAL_8250_PCILIB=y
>CONFIG_SERIAL_8250_PCI=y
>CONFIG_SERIAL_8250_EXAR=y
># CONFIG_SERIAL_8250_MEN_MCB is not set
>CONFIG_SERIAL_8250_NR_UARTS=4
>CONFIG_SERIAL_8250_RUNTIME_UARTS=4
># CONFIG_SERIAL_8250_EXTENDED is not set
># CONFIG_SERIAL_8250_PCI1XXXX is not set
>CONFIG_SERIAL_8250_DWLIB=y
># CONFIG_SERIAL_8250_DFL is not set
># CONFIG_SERIAL_8250_DW is not set
># CONFIG_SERIAL_8250_RT288X is not set
>CONFIG_SERIAL_8250_LPSS=y
>CONFIG_SERIAL_8250_MID=y
>CONFIG_SERIAL_8250_PERICOM=y
># CONFIG_SERIAL_OF_PLATFORM is not set
>
>#
># Non-8250 serial port support
>#
># CONFIG_SERIAL_UARTLITE is not set
>CONFIG_SERIAL_CORE=y
>CONFIG_SERIAL_CORE_CONSOLE=y
># CONFIG_SERIAL_JSM is not set
># CONFIG_SERIAL_SIFIVE is not set
># CONFIG_SERIAL_LANTIQ is not set
># CONFIG_SERIAL_SCCNXP is not set
># CONFIG_SERIAL_SC16IS7XX is not set
># CONFIG_SERIAL_TIMBERDALE is not set
># CONFIG_SERIAL_ALTERA_JTAGUART is not set
># CONFIG_SERIAL_ALTERA_UART is not set
># CONFIG_SERIAL_PCH_UART is not set
># CONFIG_SERIAL_XILINX_PS_UART is not set
># CONFIG_SERIAL_ARC is not set
># CONFIG_SERIAL_RP2 is not set
># CONFIG_SERIAL_FSL_LPUART is not set
># CONFIG_SERIAL_FSL_LINFLEXUART is not set
># CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
># CONFIG_SERIAL_MEN_Z135 is not set
># CONFIG_SERIAL_SPRD is not set
># CONFIG_SERIAL_LITEUART is not set
># end of Serial drivers
>
>CONFIG_SERIAL_MCTRL_GPIO=y
># CONFIG_SERIAL_NONSTANDARD is not set
># CONFIG_N_GSM is not set
># CONFIG_NOZOMI is not set
># CONFIG_NULL_TTY is not set
># CONFIG_RPMSG_TTY is not set
># CONFIG_SERIAL_DEV_BUS is not set
># CONFIG_TTY_PRINTK is not set
># CONFIG_VIRTIO_CONSOLE is not set
># CONFIG_IPMI_HANDLER is not set
># CONFIG_SSIF_IPMI_BMC is not set
>CONFIG_IPMB_DEVICE_INTERFACE=y
>CONFIG_HW_RANDOM=y
># CONFIG_HW_RANDOM_TIMERIOMEM is not set
>CONFIG_HW_RANDOM_INTEL=y
># CONFIG_HW_RANDOM_AMD is not set
>CONFIG_HW_RANDOM_BA431=y
>CONFIG_HW_RANDOM_GEODE=y
>CONFIG_HW_RANDOM_VIA=y
>CONFIG_HW_RANDOM_VIRTIO=y
>CONFIG_HW_RANDOM_CCTRNG=y
>CONFIG_HW_RANDOM_XIPHERA=y
># CONFIG_DTLK is not set
># CONFIG_APPLICOM is not set
># CONFIG_SONYPI is not set
># CONFIG_MWAVE is not set
>CONFIG_SCx200_GPIO=y
># CONFIG_PC8736x_GPIO is not set
>CONFIG_NSC_GPIO=y
># CONFIG_DEVMEM is not set
>CONFIG_NVRAM=y
># CONFIG_DEVPORT is not set
># CONFIG_HPET is not set
>CONFIG_HANGCHECK_TIMER=y
># CONFIG_TCG_TPM is not set
>CONFIG_TELCLOCK=y
>CONFIG_XILLYBUS_CLASS=y
>CONFIG_XILLYBUS=y
>CONFIG_XILLYBUS_OF=y
># end of Character devices
>
>#
># I2C support
>#
>CONFIG_I2C=y
># CONFIG_ACPI_I2C_OPREGION is not set
>CONFIG_I2C_BOARDINFO=y
># CONFIG_I2C_COMPAT is not set
>CONFIG_I2C_CHARDEV=y
>CONFIG_I2C_MUX=y
>
>#
># Multiplexer I2C Chip support
>#
>CONFIG_I2C_ARB_GPIO_CHALLENGE=y
>CONFIG_I2C_MUX_GPIO=y
>CONFIG_I2C_MUX_GPMUX=y
># CONFIG_I2C_MUX_LTC4306 is not set
># CONFIG_I2C_MUX_PCA9541 is not set
># CONFIG_I2C_MUX_PCA954x is not set
>CONFIG_I2C_MUX_PINCTRL=y
># CONFIG_I2C_MUX_REG is not set
>CONFIG_I2C_DEMUX_PINCTRL=y
>CONFIG_I2C_MUX_MLXCPLD=y
># end of Multiplexer I2C Chip support
>
>CONFIG_I2C_HELPER_AUTO=y
>CONFIG_I2C_SMBUS=y
>CONFIG_I2C_ALGOBIT=y
>CONFIG_I2C_ALGOPCA=y
>
>#
># I2C Hardware Bus support
>#
>
>#
># PC SMBus host controller drivers
>#
># CONFIG_I2C_ALI1535 is not set
># CONFIG_I2C_ALI1563 is not set
># CONFIG_I2C_ALI15X3 is not set
># CONFIG_I2C_AMD756 is not set
># CONFIG_I2C_AMD8111 is not set
># CONFIG_I2C_AMD_MP2 is not set
># CONFIG_I2C_I801 is not set
># CONFIG_I2C_ISCH is not set
># CONFIG_I2C_ISMT is not set
># CONFIG_I2C_PIIX4 is not set
># CONFIG_I2C_NFORCE2 is not set
># CONFIG_I2C_NVIDIA_GPU is not set
># CONFIG_I2C_SIS5595 is not set
># CONFIG_I2C_SIS630 is not set
># CONFIG_I2C_SIS96X is not set
># CONFIG_I2C_VIA is not set
># CONFIG_I2C_VIAPRO is not set
>
>#
># ACPI drivers
>#
># CONFIG_I2C_SCMI is not set
>
>#
># I2C system bus drivers (mostly embedded / system-on-chip)
>#
>CONFIG_I2C_CBUS_GPIO=y
>CONFIG_I2C_DESIGNWARE_CORE=y
># CONFIG_I2C_DESIGNWARE_SLAVE is not set
>CONFIG_I2C_DESIGNWARE_PLATFORM=y
># CONFIG_I2C_DESIGNWARE_PCI is not set
># CONFIG_I2C_EG20T is not set
>CONFIG_I2C_EMEV2=y
>CONFIG_I2C_GPIO=y
># CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
>CONFIG_I2C_KEMPLD=y
>CONFIG_I2C_OCORES=y
>CONFIG_I2C_PCA_PLATFORM=y
>CONFIG_I2C_PXA=y
>CONFIG_I2C_PXA_PCI=y
>CONFIG_I2C_RK3X=y
># CONFIG_I2C_SIMTEC is not set
>CONFIG_I2C_XILINX=y
>
>#
># External I2C/SMBus adapter drivers
>#
># CONFIG_I2C_PCI1XXXX is not set
># CONFIG_I2C_TAOS_EVM is not set
>
>#
># Other I2C/SMBus bus drivers
>#
># CONFIG_I2C_ELEKTOR is not set
># CONFIG_I2C_PCA_ISA is not set
>CONFIG_I2C_CROS_EC_TUNNEL=y
># CONFIG_SCx200_ACB is not set
># CONFIG_I2C_VIRTIO is not set
># end of I2C Hardware Bus support
>
># CONFIG_I2C_STUB is not set
>CONFIG_I2C_SLAVE=y
>CONFIG_I2C_SLAVE_EEPROM=y
># CONFIG_I2C_SLAVE_TESTUNIT is not set
># CONFIG_I2C_DEBUG_CORE is not set
># CONFIG_I2C_DEBUG_ALGO is not set
># CONFIG_I2C_DEBUG_BUS is not set
># end of I2C support
>
># CONFIG_I3C is not set
># CONFIG_SPI is not set
>CONFIG_SPMI=y
>CONFIG_SPMI_HISI3670=y
>CONFIG_HSI=y
>CONFIG_HSI_BOARDINFO=y
>
>#
># HSI controllers
>#
>
>#
># HSI clients
>#
># CONFIG_HSI_CHAR is not set
>CONFIG_PPS=y
># CONFIG_PPS_DEBUG is not set
>
>#
># PPS clients support
>#
>CONFIG_PPS_CLIENT_KTIMER=y
># CONFIG_PPS_CLIENT_LDISC is not set
>CONFIG_PPS_CLIENT_GPIO=y
>
>#
># PPS generators support
>#
>
>#
># PTP clock support
>#
>CONFIG_PTP_1588_CLOCK_OPTIONAL=y
>
>#
># Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
>#
># end of PTP clock support
>
>CONFIG_PINCTRL=y
>CONFIG_GENERIC_PINCTRL_GROUPS=y
>CONFIG_PINMUX=y
>CONFIG_GENERIC_PINMUX_FUNCTIONS=y
>CONFIG_PINCONF=y
>CONFIG_GENERIC_PINCONF=y
># CONFIG_DEBUG_PINCTRL is not set
># CONFIG_PINCTRL_AMD is not set
>CONFIG_PINCTRL_AS3722=y
># CONFIG_PINCTRL_AXP209 is not set
>CONFIG_PINCTRL_CY8C95X0=y
>CONFIG_PINCTRL_DA9062=y
>CONFIG_PINCTRL_EQUILIBRIUM=y
>CONFIG_PINCTRL_MCP23S08_I2C=y
>CONFIG_PINCTRL_MCP23S08=y
># CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
>CONFIG_PINCTRL_OCELOT=y
>CONFIG_PINCTRL_PALMAS=y
>CONFIG_PINCTRL_SINGLE=y
># CONFIG_PINCTRL_STMFX is not set
>CONFIG_PINCTRL_SX150X=y
>
>#
># Intel pinctrl drivers
>#
>CONFIG_PINCTRL_BAYTRAIL=y
># CONFIG_PINCTRL_CHERRYVIEW is not set
># CONFIG_PINCTRL_LYNXPOINT is not set
>CONFIG_PINCTRL_INTEL=y
># CONFIG_PINCTRL_ALDERLAKE is not set
>CONFIG_PINCTRL_BROXTON=y
>CONFIG_PINCTRL_CANNONLAKE=y
>CONFIG_PINCTRL_CEDARFORK=y
># CONFIG_PINCTRL_DENVERTON is not set
># CONFIG_PINCTRL_ELKHARTLAKE is not set
>CONFIG_PINCTRL_EMMITSBURG=y
># CONFIG_PINCTRL_GEMINILAKE is not set
>CONFIG_PINCTRL_ICELAKE=y
>CONFIG_PINCTRL_JASPERLAKE=y
>CONFIG_PINCTRL_LAKEFIELD=y
>CONFIG_PINCTRL_LEWISBURG=y
>CONFIG_PINCTRL_METEORLAKE=y
>CONFIG_PINCTRL_SUNRISEPOINT=y
># CONFIG_PINCTRL_TIGERLAKE is not set
># end of Intel pinctrl drivers
>
>#
># Renesas pinctrl drivers
>#
># end of Renesas pinctrl drivers
>
>CONFIG_GPIOLIB=y
>CONFIG_GPIOLIB_FASTPATH_LIMIT=512
>CONFIG_OF_GPIO=y
>CONFIG_GPIO_ACPI=y
>CONFIG_GPIOLIB_IRQCHIP=y
>CONFIG_OF_GPIO_MM_GPIOCHIP=y
># CONFIG_DEBUG_GPIO is not set
># CONFIG_GPIO_SYSFS is not set
>CONFIG_GPIO_CDEV=y
># CONFIG_GPIO_CDEV_V1 is not set
>CONFIG_GPIO_GENERIC=y
>CONFIG_GPIO_MAX730X=y
>
>#
># Memory mapped GPIO drivers
>#
># CONFIG_GPIO_74XX_MMIO is not set
>CONFIG_GPIO_ALTERA=y
># CONFIG_GPIO_AMDPT is not set
>CONFIG_GPIO_CADENCE=y
>CONFIG_GPIO_DWAPB=y
># CONFIG_GPIO_EXAR is not set
>CONFIG_GPIO_FTGPIO010=y
># CONFIG_GPIO_GENERIC_PLATFORM is not set
>CONFIG_GPIO_GRGPIO=y
># CONFIG_GPIO_HLWD is not set
>CONFIG_GPIO_LOGICVC=y
>CONFIG_GPIO_MB86S7X=y
># CONFIG_GPIO_MENZ127 is not set
>CONFIG_GPIO_SIFIVE=y
>CONFIG_GPIO_SYSCON=y
># CONFIG_GPIO_VX855 is not set
>CONFIG_GPIO_WCD934X=y
>CONFIG_GPIO_XILINX=y
># CONFIG_GPIO_AMD_FCH is not set
># end of Memory mapped GPIO drivers
>
>#
># Port-mapped I/O GPIO drivers
>#
>CONFIG_GPIO_F7188X=y
>CONFIG_GPIO_IT87=y
># CONFIG_GPIO_SCH311X is not set
>CONFIG_GPIO_WINBOND=y
># CONFIG_GPIO_WS16C48 is not set
># end of Port-mapped I/O GPIO drivers
>
>#
># I2C GPIO expanders
>#
>CONFIG_GPIO_ADNP=y
># CONFIG_GPIO_FXL6408 is not set
>CONFIG_GPIO_GW_PLD=y
>CONFIG_GPIO_MAX7300=y
>CONFIG_GPIO_MAX732X=y
># CONFIG_GPIO_MAX732X_IRQ is not set
>CONFIG_GPIO_PCA953X=y
>CONFIG_GPIO_PCA953X_IRQ=y
># CONFIG_GPIO_PCA9570 is not set
>CONFIG_GPIO_PCF857X=y
>CONFIG_GPIO_TPIC2810=y
># end of I2C GPIO expanders
>
>#
># MFD GPIO expanders
>#
>CONFIG_GPIO_ARIZONA=y
># CONFIG_GPIO_ELKHARTLAKE is not set
># CONFIG_GPIO_KEMPLD is not set
>CONFIG_GPIO_LP3943=y
># CONFIG_GPIO_LP873X is not set
>CONFIG_GPIO_LP87565=y
># CONFIG_GPIO_MAX77650 is not set
># CONFIG_GPIO_PALMAS is not set
># CONFIG_GPIO_RC5T583 is not set
># CONFIG_GPIO_TPS65086 is not set
># CONFIG_GPIO_TPS65218 is not set
>CONFIG_GPIO_TPS6586X=y
>CONFIG_GPIO_TPS65910=y
>CONFIG_GPIO_TWL6040=y
># CONFIG_GPIO_WM8350 is not set
># CONFIG_GPIO_WM8994 is not set
># end of MFD GPIO expanders
>
>#
># PCI GPIO expanders
>#
># CONFIG_GPIO_AMD8111 is not set
># CONFIG_GPIO_BT8XX is not set
># CONFIG_GPIO_ML_IOH is not set
># CONFIG_GPIO_PCH is not set
># CONFIG_GPIO_PCI_IDIO_16 is not set
># CONFIG_GPIO_PCIE_IDIO_24 is not set
># CONFIG_GPIO_RDC321X is not set
># CONFIG_GPIO_SODAVILLE is not set
># end of PCI GPIO expanders
>
>#
># Virtual GPIO drivers
>#
>CONFIG_GPIO_AGGREGATOR=y
># CONFIG_GPIO_LATCH is not set
># CONFIG_GPIO_MOCKUP is not set
>CONFIG_GPIO_VIRTIO=y
>CONFIG_GPIO_SIM=y
># end of Virtual GPIO drivers
>
>CONFIG_W1=y
># CONFIG_W1_CON is not set
>
>#
># 1-wire Bus Masters
>#
># CONFIG_W1_MASTER_MATROX is not set
>CONFIG_W1_MASTER_DS2482=y
>CONFIG_W1_MASTER_GPIO=y
>CONFIG_W1_MASTER_SGI=y
># end of 1-wire Bus Masters
>
>#
># 1-wire Slaves
>#
>CONFIG_W1_SLAVE_THERM=y
># CONFIG_W1_SLAVE_SMEM is not set
># CONFIG_W1_SLAVE_DS2405 is not set
># CONFIG_W1_SLAVE_DS2408 is not set
>CONFIG_W1_SLAVE_DS2413=y
># CONFIG_W1_SLAVE_DS2406 is not set
># CONFIG_W1_SLAVE_DS2423 is not set
>CONFIG_W1_SLAVE_DS2805=y
># CONFIG_W1_SLAVE_DS2430 is not set
># CONFIG_W1_SLAVE_DS2431 is not set
># CONFIG_W1_SLAVE_DS2433 is not set
>CONFIG_W1_SLAVE_DS2438=y
>CONFIG_W1_SLAVE_DS250X=y
>CONFIG_W1_SLAVE_DS2780=y
>CONFIG_W1_SLAVE_DS2781=y
># CONFIG_W1_SLAVE_DS28E04 is not set
># CONFIG_W1_SLAVE_DS28E17 is not set
># end of 1-wire Slaves
>
># CONFIG_POWER_RESET is not set
>CONFIG_POWER_SUPPLY=y
># CONFIG_POWER_SUPPLY_DEBUG is not set
>CONFIG_POWER_SUPPLY_HWMON=y
># CONFIG_IP5XXX_POWER is not set
>CONFIG_WM8350_POWER=y
># CONFIG_TEST_POWER is not set
>CONFIG_BATTERY_88PM860X=y
>CONFIG_CHARGER_ADP5061=y
>CONFIG_BATTERY_ACT8945A=y
>CONFIG_BATTERY_CW2015=y
>CONFIG_BATTERY_DS2760=y
>CONFIG_BATTERY_DS2780=y
>CONFIG_BATTERY_DS2781=y
>CONFIG_BATTERY_DS2782=y
>CONFIG_BATTERY_SAMSUNG_SDI=y
>CONFIG_BATTERY_SBS=y
>CONFIG_CHARGER_SBS=y
>CONFIG_MANAGER_SBS=y
># CONFIG_BATTERY_BQ27XXX is not set
>CONFIG_BATTERY_DA9030=y
>CONFIG_BATTERY_DA9150=y
>CONFIG_BATTERY_MAX17040=y
>CONFIG_BATTERY_MAX17042=y
>CONFIG_BATTERY_MAX1721X=y
># CONFIG_CHARGER_88PM860X is not set
>CONFIG_CHARGER_MAX8903=y
>CONFIG_CHARGER_LP8727=y
>CONFIG_CHARGER_GPIO=y
>CONFIG_CHARGER_MANAGER=y
># CONFIG_CHARGER_LT3651 is not set
>CONFIG_CHARGER_LTC4162L=y
># CONFIG_CHARGER_MAX14577 is not set
>CONFIG_CHARGER_DETECTOR_MAX14656=y
># CONFIG_CHARGER_MAX77650 is not set
># CONFIG_CHARGER_MAX77976 is not set
>CONFIG_CHARGER_BQ2415X=y
># CONFIG_CHARGER_BQ24190 is not set
># CONFIG_CHARGER_BQ24257 is not set
>CONFIG_CHARGER_BQ24735=y
># CONFIG_CHARGER_BQ2515X is not set
># CONFIG_CHARGER_BQ25890 is not set
>CONFIG_CHARGER_BQ25980=y
># CONFIG_CHARGER_BQ256XX is not set
># CONFIG_CHARGER_SMB347 is not set
>CONFIG_CHARGER_TPS65090=y
>CONFIG_CHARGER_TPS65217=y
># CONFIG_BATTERY_GAUGE_LTC2941 is not set
>CONFIG_BATTERY_GOLDFISH=y
>CONFIG_BATTERY_RT5033=y
>CONFIG_CHARGER_RT9455=y
># CONFIG_CHARGER_RT9467 is not set
># CONFIG_CHARGER_RT9471 is not set
>CONFIG_CHARGER_CROS_USBPD=y
>CONFIG_CHARGER_CROS_PCHG=y
>CONFIG_CHARGER_UCS1002=y
># CONFIG_CHARGER_BD99954 is not set
># CONFIG_CHARGER_WILCO is not set
>CONFIG_BATTERY_UG3105=y
>CONFIG_HWMON=y
>CONFIG_HWMON_VID=y
>CONFIG_HWMON_DEBUG_CHIP=y
>
>#
># Native drivers
>#
>CONFIG_SENSORS_ABITUGURU=y
># CONFIG_SENSORS_ABITUGURU3 is not set
>CONFIG_SENSORS_AD7414=y
>CONFIG_SENSORS_AD7418=y
># CONFIG_SENSORS_ADM1025 is not set
>CONFIG_SENSORS_ADM1026=y
>CONFIG_SENSORS_ADM1029=y
># CONFIG_SENSORS_ADM1031 is not set
>CONFIG_SENSORS_ADM1177=y
>CONFIG_SENSORS_ADM9240=y
>CONFIG_SENSORS_ADT7X10=y
>CONFIG_SENSORS_ADT7410=y
># CONFIG_SENSORS_ADT7411 is not set
># CONFIG_SENSORS_ADT7462 is not set
>CONFIG_SENSORS_ADT7470=y
># CONFIG_SENSORS_ADT7475 is not set
>CONFIG_SENSORS_AHT10=y
>CONFIG_SENSORS_AS370=y
># CONFIG_SENSORS_ASC7621 is not set
># CONFIG_SENSORS_AXI_FAN_CONTROL is not set
># CONFIG_SENSORS_K8TEMP is not set
># CONFIG_SENSORS_APPLESMC is not set
># CONFIG_SENSORS_ASB100 is not set
>CONFIG_SENSORS_ATXP1=y
># CONFIG_SENSORS_CORSAIR_CPRO is not set
># CONFIG_SENSORS_CORSAIR_PSU is not set
>CONFIG_SENSORS_DS620=y
>CONFIG_SENSORS_DS1621=y
>CONFIG_SENSORS_DELL_SMM=y
># CONFIG_I8K is not set
># CONFIG_SENSORS_I5K_AMB is not set
>CONFIG_SENSORS_F71805F=y
># CONFIG_SENSORS_F71882FG is not set
>CONFIG_SENSORS_F75375S=y
>CONFIG_SENSORS_GSC=y
># CONFIG_SENSORS_FSCHMD is not set
>CONFIG_SENSORS_GL518SM=y
>CONFIG_SENSORS_GL520SM=y
>CONFIG_SENSORS_G760A=y
># CONFIG_SENSORS_G762 is not set
>CONFIG_SENSORS_GPIO_FAN=y
># CONFIG_SENSORS_HIH6130 is not set
># CONFIG_SENSORS_I5500 is not set
>CONFIG_SENSORS_CORETEMP=y
># CONFIG_SENSORS_IT87 is not set
>CONFIG_SENSORS_JC42=y
># CONFIG_SENSORS_POWR1220 is not set
>CONFIG_SENSORS_LINEAGE=y
>CONFIG_SENSORS_LTC2945=y
>CONFIG_SENSORS_LTC2947=y
>CONFIG_SENSORS_LTC2947_I2C=y
>CONFIG_SENSORS_LTC2990=y
># CONFIG_SENSORS_LTC2992 is not set
>CONFIG_SENSORS_LTC4151=y
>CONFIG_SENSORS_LTC4215=y
># CONFIG_SENSORS_LTC4222 is not set
># CONFIG_SENSORS_LTC4245 is not set
># CONFIG_SENSORS_LTC4260 is not set
>CONFIG_SENSORS_LTC4261=y
>CONFIG_SENSORS_MAX127=y
># CONFIG_SENSORS_MAX16065 is not set
>CONFIG_SENSORS_MAX1619=y
>CONFIG_SENSORS_MAX1668=y
>CONFIG_SENSORS_MAX197=y
># CONFIG_SENSORS_MAX31730 is not set
># CONFIG_SENSORS_MAX31760 is not set
>CONFIG_SENSORS_MAX6620=y
>CONFIG_SENSORS_MAX6621=y
>CONFIG_SENSORS_MAX6639=y
>CONFIG_SENSORS_MAX6650=y
>CONFIG_SENSORS_MAX6697=y
>CONFIG_SENSORS_MAX31790=y
># CONFIG_SENSORS_MC34VR500 is not set
># CONFIG_SENSORS_MCP3021 is not set
># CONFIG_SENSORS_MLXREG_FAN is not set
>CONFIG_SENSORS_TC654=y
>CONFIG_SENSORS_TPS23861=y
>CONFIG_SENSORS_MENF21BMC_HWMON=y
>CONFIG_SENSORS_MR75203=y
>CONFIG_SENSORS_LM63=y
>CONFIG_SENSORS_LM73=y
>CONFIG_SENSORS_LM75=y
>CONFIG_SENSORS_LM77=y
>CONFIG_SENSORS_LM78=y
># CONFIG_SENSORS_LM80 is not set
># CONFIG_SENSORS_LM83 is not set
># CONFIG_SENSORS_LM85 is not set
>CONFIG_SENSORS_LM87=y
>CONFIG_SENSORS_LM90=y
># CONFIG_SENSORS_LM92 is not set
>CONFIG_SENSORS_LM93=y
># CONFIG_SENSORS_LM95234 is not set
>CONFIG_SENSORS_LM95241=y
>CONFIG_SENSORS_LM95245=y
>CONFIG_SENSORS_PC87360=y
>CONFIG_SENSORS_PC87427=y
># CONFIG_SENSORS_NCT6683 is not set
>CONFIG_SENSORS_NCT6775_CORE=y
>CONFIG_SENSORS_NCT6775=y
>CONFIG_SENSORS_NCT6775_I2C=y
># CONFIG_SENSORS_NCT7802 is not set
># CONFIG_SENSORS_NPCM7XX is not set
>CONFIG_SENSORS_OCC_P8_I2C=y
>CONFIG_SENSORS_OCC=y
># CONFIG_SENSORS_OXP is not set
>CONFIG_SENSORS_PCF8591=y
># CONFIG_SENSORS_PECI_CPUTEMP is not set
>CONFIG_SENSORS_PECI_DIMMTEMP=y
>CONFIG_SENSORS_PECI=y
>CONFIG_PMBUS=y
>CONFIG_SENSORS_PMBUS=y
># CONFIG_SENSORS_ACBEL_FSG032 is not set
>CONFIG_SENSORS_ADM1266=y
>CONFIG_SENSORS_ADM1275=y
># CONFIG_SENSORS_BEL_PFE is not set
># CONFIG_SENSORS_BPA_RS600 is not set
># CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
>CONFIG_SENSORS_FSP_3Y=y
>CONFIG_SENSORS_IBM_CFFPS=y
># CONFIG_SENSORS_DPS920AB is not set
>CONFIG_SENSORS_INSPUR_IPSPS=y
>CONFIG_SENSORS_IR35221=y
># CONFIG_SENSORS_IR36021 is not set
># CONFIG_SENSORS_IR38064 is not set
># CONFIG_SENSORS_IRPS5401 is not set
># CONFIG_SENSORS_ISL68137 is not set
>CONFIG_SENSORS_LM25066=y
>CONFIG_SENSORS_LM25066_REGULATOR=y
># CONFIG_SENSORS_LT7182S is not set
>CONFIG_SENSORS_LTC2978=y
>CONFIG_SENSORS_LTC2978_REGULATOR=y
>CONFIG_SENSORS_LTC3815=y
>CONFIG_SENSORS_MAX15301=y
>CONFIG_SENSORS_MAX16064=y
># CONFIG_SENSORS_MAX16601 is not set
># CONFIG_SENSORS_MAX20730 is not set
># CONFIG_SENSORS_MAX20751 is not set
># CONFIG_SENSORS_MAX31785 is not set
># CONFIG_SENSORS_MAX34440 is not set
>CONFIG_SENSORS_MAX8688=y
>CONFIG_SENSORS_MP2888=y
># CONFIG_SENSORS_MP2975 is not set
># CONFIG_SENSORS_MP5023 is not set
># CONFIG_SENSORS_MPQ7932 is not set
># CONFIG_SENSORS_PIM4328 is not set
># CONFIG_SENSORS_PLI1209BC is not set
># CONFIG_SENSORS_PM6764TR is not set
># CONFIG_SENSORS_PXE1610 is not set
>CONFIG_SENSORS_Q54SJ108A2=y
># CONFIG_SENSORS_STPDDC60 is not set
># CONFIG_SENSORS_TDA38640 is not set
>CONFIG_SENSORS_TPS40422=y
>CONFIG_SENSORS_TPS53679=y
>CONFIG_SENSORS_TPS546D24=y
>CONFIG_SENSORS_UCD9000=y
>CONFIG_SENSORS_UCD9200=y
>CONFIG_SENSORS_XDPE152=y
>CONFIG_SENSORS_XDPE122=y
>CONFIG_SENSORS_XDPE122_REGULATOR=y
># CONFIG_SENSORS_ZL6100 is not set
>CONFIG_SENSORS_PWM_FAN=y
>CONFIG_SENSORS_SBTSI=y
>CONFIG_SENSORS_SBRMI=y
>CONFIG_SENSORS_SHT15=y
># CONFIG_SENSORS_SHT21 is not set
># CONFIG_SENSORS_SHT3x is not set
># CONFIG_SENSORS_SHT4x is not set
>CONFIG_SENSORS_SHTC1=y
># CONFIG_SENSORS_SIS5595 is not set
>CONFIG_SENSORS_SY7636A=y
>CONFIG_SENSORS_DME1737=y
>CONFIG_SENSORS_EMC1403=y
>CONFIG_SENSORS_EMC2103=y
>CONFIG_SENSORS_EMC2305=y
>CONFIG_SENSORS_EMC6W201=y
># CONFIG_SENSORS_SMSC47M1 is not set
># CONFIG_SENSORS_SMSC47M192 is not set
>CONFIG_SENSORS_SMSC47B397=y
># CONFIG_SENSORS_STTS751 is not set
># CONFIG_SENSORS_SMM665 is not set
>CONFIG_SENSORS_ADC128D818=y
>CONFIG_SENSORS_ADS7828=y
>CONFIG_SENSORS_AMC6821=y
>CONFIG_SENSORS_INA209=y
>CONFIG_SENSORS_INA2XX=y
>CONFIG_SENSORS_INA238=y
>CONFIG_SENSORS_INA3221=y
>CONFIG_SENSORS_TC74=y
>CONFIG_SENSORS_THMC50=y
>CONFIG_SENSORS_TMP102=y
>CONFIG_SENSORS_TMP103=y
># CONFIG_SENSORS_TMP108 is not set
>CONFIG_SENSORS_TMP401=y
>CONFIG_SENSORS_TMP421=y
>CONFIG_SENSORS_TMP464=y
>CONFIG_SENSORS_TMP513=y
>CONFIG_SENSORS_VIA_CPUTEMP=y
># CONFIG_SENSORS_VIA686A is not set
>CONFIG_SENSORS_VT1211=y
># CONFIG_SENSORS_VT8231 is not set
>CONFIG_SENSORS_W83773G=y
>CONFIG_SENSORS_W83781D=y
># CONFIG_SENSORS_W83791D is not set
>CONFIG_SENSORS_W83792D=y
>CONFIG_SENSORS_W83793=y
># CONFIG_SENSORS_W83795 is not set
>CONFIG_SENSORS_W83L785TS=y
>CONFIG_SENSORS_W83L786NG=y
>CONFIG_SENSORS_W83627HF=y
>CONFIG_SENSORS_W83627EHF=y
>CONFIG_SENSORS_WM8350=y
>
>#
># ACPI drivers
>#
># CONFIG_SENSORS_ACPI_POWER is not set
># CONFIG_SENSORS_ATK0110 is not set
># CONFIG_SENSORS_ASUS_WMI is not set
># CONFIG_SENSORS_ASUS_EC is not set
>CONFIG_THERMAL=y
>CONFIG_THERMAL_NETLINK=y
># CONFIG_THERMAL_STATISTICS is not set
>CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
>CONFIG_THERMAL_HWMON=y
># CONFIG_THERMAL_OF is not set
>CONFIG_THERMAL_WRITABLE_TRIPS=y
>CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
># CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
># CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
># CONFIG_THERMAL_GOV_FAIR_SHARE is not set
>CONFIG_THERMAL_GOV_STEP_WISE=y
># CONFIG_THERMAL_GOV_BANG_BANG is not set
># CONFIG_THERMAL_GOV_USER_SPACE is not set
>CONFIG_DEVFREQ_THERMAL=y
># CONFIG_THERMAL_EMULATION is not set
>CONFIG_THERMAL_MMIO=y
>CONFIG_DA9062_THERMAL=y
>
>#
># Intel thermal drivers
>#
>CONFIG_INTEL_POWERCLAMP=y
>CONFIG_INTEL_TCC=y
># CONFIG_INTEL_SOC_DTS_THERMAL is not set
>
>#
># ACPI INT340X thermal drivers
>#
># end of ACPI INT340X thermal drivers
>
># CONFIG_INTEL_PCH_THERMAL is not set
>CONFIG_INTEL_TCC_COOLING=y
># end of Intel thermal drivers
>
># CONFIG_TI_SOC_THERMAL is not set
># CONFIG_WATCHDOG is not set
>CONFIG_SSB_POSSIBLE=y
># CONFIG_SSB is not set
>CONFIG_BCMA_POSSIBLE=y
>CONFIG_BCMA=y
>CONFIG_BCMA_HOST_PCI_POSSIBLE=y
>CONFIG_BCMA_HOST_PCI=y
># CONFIG_BCMA_HOST_SOC is not set
>CONFIG_BCMA_DRIVER_PCI=y
># CONFIG_BCMA_DRIVER_GMAC_CMN is not set
># CONFIG_BCMA_DRIVER_GPIO is not set
># CONFIG_BCMA_DEBUG is not set
>
>#
># Multifunction device drivers
>#
>CONFIG_MFD_CORE=y
># CONFIG_MFD_CS5535 is not set
>CONFIG_MFD_ACT8945A=y
>CONFIG_MFD_AS3711=y
># CONFIG_MFD_SMPRO is not set
>CONFIG_MFD_AS3722=y
># CONFIG_PMIC_ADP5520 is not set
># CONFIG_MFD_AAT2870_CORE is not set
>CONFIG_MFD_ATMEL_FLEXCOM=y
>CONFIG_MFD_ATMEL_HLCDC=y
>CONFIG_MFD_BCM590XX=y
># CONFIG_MFD_BD9571MWV is not set
>CONFIG_MFD_AXP20X=y
>CONFIG_MFD_AXP20X_I2C=y
>CONFIG_MFD_CROS_EC_DEV=y
># CONFIG_MFD_MADERA is not set
># CONFIG_MFD_MAX597X is not set
>CONFIG_PMIC_DA903X=y
># CONFIG_MFD_DA9052_I2C is not set
># CONFIG_MFD_DA9055 is not set
>CONFIG_MFD_DA9062=y
>CONFIG_MFD_DA9063=y
>CONFIG_MFD_DA9150=y
>CONFIG_MFD_GATEWORKS_GSC=y
># CONFIG_MFD_MC13XXX_I2C is not set
># CONFIG_MFD_MP2629 is not set
># CONFIG_MFD_HI6421_PMIC is not set
>CONFIG_MFD_HI6421_SPMI=y
># CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
># CONFIG_LPC_ICH is not set
># CONFIG_LPC_SCH is not set
># CONFIG_INTEL_SOC_PMIC is not set
># CONFIG_INTEL_SOC_PMIC_BXTWC is not set
># CONFIG_INTEL_SOC_PMIC_CHTWC is not set
># CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
>CONFIG_INTEL_SOC_PMIC_MRFLD=y
>CONFIG_MFD_INTEL_LPSS=y
>CONFIG_MFD_INTEL_LPSS_ACPI=y
># CONFIG_MFD_INTEL_LPSS_PCI is not set
>CONFIG_MFD_INTEL_PMC_BXT=y
>CONFIG_MFD_IQS62X=y
># CONFIG_MFD_JANZ_CMODIO is not set
>CONFIG_MFD_KEMPLD=y
>CONFIG_MFD_88PM800=y
># CONFIG_MFD_88PM805 is not set
>CONFIG_MFD_88PM860X=y
>CONFIG_MFD_MAX14577=y
># CONFIG_MFD_MAX77620 is not set
>CONFIG_MFD_MAX77650=y
>CONFIG_MFD_MAX77686=y
># CONFIG_MFD_MAX77693 is not set
># CONFIG_MFD_MAX77714 is not set
>CONFIG_MFD_MAX77843=y
># CONFIG_MFD_MAX8907 is not set
># CONFIG_MFD_MAX8925 is not set
># CONFIG_MFD_MAX8997 is not set
># CONFIG_MFD_MAX8998 is not set
># CONFIG_MFD_MT6360 is not set
>CONFIG_MFD_MT6370=y
>CONFIG_MFD_MT6397=y
>CONFIG_MFD_MENF21BMC=y
>CONFIG_MFD_NTXEC=y
># CONFIG_MFD_RETU is not set
># CONFIG_MFD_PCF50633 is not set
>CONFIG_MFD_SY7636A=y
># CONFIG_MFD_RDC321X is not set
>CONFIG_MFD_RT4831=y
>CONFIG_MFD_RT5033=y
># CONFIG_MFD_RT5120 is not set
>CONFIG_MFD_RC5T583=y
># CONFIG_MFD_RK808 is not set
>CONFIG_MFD_RN5T618=y
>CONFIG_MFD_SEC_CORE=y
># CONFIG_MFD_SI476X_CORE is not set
>CONFIG_MFD_SIMPLE_MFD_I2C=y
>CONFIG_MFD_SM501=y
># CONFIG_MFD_SM501_GPIO is not set
>CONFIG_MFD_SKY81452=y
># CONFIG_MFD_STMPE is not set
>CONFIG_MFD_SYSCON=y
>CONFIG_MFD_TI_AM335X_TSCADC=y
>CONFIG_MFD_LP3943=y
>CONFIG_MFD_LP8788=y
>CONFIG_MFD_TI_LMU=y
>CONFIG_MFD_PALMAS=y
># CONFIG_TPS6105X is not set
>CONFIG_TPS65010=y
>CONFIG_TPS6507X=y
>CONFIG_MFD_TPS65086=y
>CONFIG_MFD_TPS65090=y
>CONFIG_MFD_TPS65217=y
>CONFIG_MFD_TI_LP873X=y
>CONFIG_MFD_TI_LP87565=y
>CONFIG_MFD_TPS65218=y
># CONFIG_MFD_TPS65219 is not set
>CONFIG_MFD_TPS6586X=y
>CONFIG_MFD_TPS65910=y
># CONFIG_MFD_TPS65912_I2C is not set
># CONFIG_TWL4030_CORE is not set
>CONFIG_TWL6040_CORE=y
>CONFIG_MFD_WL1273_CORE=y
>CONFIG_MFD_LM3533=y
># CONFIG_MFD_TIMBERDALE is not set
># CONFIG_MFD_TC3589X is not set
># CONFIG_MFD_TQMX86 is not set
># CONFIG_MFD_VX855 is not set
># CONFIG_MFD_LOCHNAGAR is not set
>CONFIG_MFD_ARIZONA=y
>CONFIG_MFD_ARIZONA_I2C=y
># CONFIG_MFD_CS47L24 is not set
>CONFIG_MFD_WM5102=y
># CONFIG_MFD_WM5110 is not set
># CONFIG_MFD_WM8997 is not set
>CONFIG_MFD_WM8998=y
># CONFIG_MFD_WM8400 is not set
># CONFIG_MFD_WM831X_I2C is not set
>CONFIG_MFD_WM8350=y
>CONFIG_MFD_WM8350_I2C=y
>CONFIG_MFD_WM8994=y
># CONFIG_MFD_ROHM_BD718XX is not set
># CONFIG_MFD_ROHM_BD71828 is not set
>CONFIG_MFD_ROHM_BD957XMUF=y
>CONFIG_MFD_STPMIC1=y
>CONFIG_MFD_STMFX=y
>CONFIG_MFD_WCD934X=y
>CONFIG_MFD_ATC260X=y
>CONFIG_MFD_ATC260X_I2C=y
># CONFIG_MFD_QCOM_PM8008 is not set
># CONFIG_MFD_INTEL_M10_BMC_PMCI is not set
>CONFIG_MFD_RSMU_I2C=y
># end of Multifunction device drivers
>
>CONFIG_REGULATOR=y
># CONFIG_REGULATOR_DEBUG is not set
>CONFIG_REGULATOR_FIXED_VOLTAGE=y
>CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
>CONFIG_REGULATOR_USERSPACE_CONSUMER=y
>CONFIG_REGULATOR_88PG86X=y
>CONFIG_REGULATOR_88PM800=y
>CONFIG_REGULATOR_88PM8607=y
>CONFIG_REGULATOR_ACT8865=y
>CONFIG_REGULATOR_ACT8945A=y
># CONFIG_REGULATOR_AD5398 is not set
>CONFIG_REGULATOR_AS3711=y
># CONFIG_REGULATOR_AS3722 is not set
>CONFIG_REGULATOR_ATC260X=y
>CONFIG_REGULATOR_AXP20X=y
>CONFIG_REGULATOR_BCM590XX=y
>CONFIG_REGULATOR_BD957XMUF=y
># CONFIG_REGULATOR_CROS_EC is not set
>CONFIG_REGULATOR_DA9062=y
># CONFIG_REGULATOR_DA9063 is not set
># CONFIG_REGULATOR_DA9121 is not set
># CONFIG_REGULATOR_DA9210 is not set
># CONFIG_REGULATOR_DA9211 is not set
>CONFIG_REGULATOR_FAN53555=y
># CONFIG_REGULATOR_FAN53880 is not set
>CONFIG_REGULATOR_GPIO=y
># CONFIG_REGULATOR_HI6421V600 is not set
>CONFIG_REGULATOR_ISL9305=y
>CONFIG_REGULATOR_ISL6271A=y
>CONFIG_REGULATOR_LM363X=y
># CONFIG_REGULATOR_LP3971 is not set
># CONFIG_REGULATOR_LP3972 is not set
># CONFIG_REGULATOR_LP872X is not set
>CONFIG_REGULATOR_LP873X=y
># CONFIG_REGULATOR_LP8755 is not set
>CONFIG_REGULATOR_LP87565=y
>CONFIG_REGULATOR_LP8788=y
># CONFIG_REGULATOR_LTC3589 is not set
># CONFIG_REGULATOR_LTC3676 is not set
># CONFIG_REGULATOR_MAX14577 is not set
>CONFIG_REGULATOR_MAX1586=y
># CONFIG_REGULATOR_MAX77650 is not set
># CONFIG_REGULATOR_MAX8649 is not set
># CONFIG_REGULATOR_MAX8660 is not set
>CONFIG_REGULATOR_MAX8893=y
>CONFIG_REGULATOR_MAX8952=y
># CONFIG_REGULATOR_MAX20086 is not set
># CONFIG_REGULATOR_MAX20411 is not set
>CONFIG_REGULATOR_MAX77686=y
>CONFIG_REGULATOR_MAX77693=y
>CONFIG_REGULATOR_MAX77802=y
>CONFIG_REGULATOR_MAX77826=y
>CONFIG_REGULATOR_MCP16502=y
>CONFIG_REGULATOR_MP5416=y
># CONFIG_REGULATOR_MP8859 is not set
># CONFIG_REGULATOR_MP886X is not set
>CONFIG_REGULATOR_MPQ7920=y
>CONFIG_REGULATOR_MT6311=y
>CONFIG_REGULATOR_MT6315=y
>CONFIG_REGULATOR_MT6323=y
># CONFIG_REGULATOR_MT6331 is not set
>CONFIG_REGULATOR_MT6332=y
># CONFIG_REGULATOR_MT6357 is not set
>CONFIG_REGULATOR_MT6358=y
>CONFIG_REGULATOR_MT6359=y
>CONFIG_REGULATOR_MT6370=y
># CONFIG_REGULATOR_MT6397 is not set
>CONFIG_REGULATOR_PALMAS=y
># CONFIG_REGULATOR_PCA9450 is not set
>CONFIG_REGULATOR_PF8X00=y
># CONFIG_REGULATOR_PFUZE100 is not set
>CONFIG_REGULATOR_PV88060=y
>CONFIG_REGULATOR_PV88080=y
># CONFIG_REGULATOR_PV88090 is not set
>CONFIG_REGULATOR_PWM=y
>CONFIG_REGULATOR_QCOM_SPMI=y
>CONFIG_REGULATOR_QCOM_USB_VBUS=y
>CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=y
>CONFIG_REGULATOR_RC5T583=y
># CONFIG_REGULATOR_RN5T618 is not set
>CONFIG_REGULATOR_RT4801=y
># CONFIG_REGULATOR_RT4803 is not set
># CONFIG_REGULATOR_RT4831 is not set
># CONFIG_REGULATOR_RT5033 is not set
>CONFIG_REGULATOR_RT5190A=y
># CONFIG_REGULATOR_RT5739 is not set
># CONFIG_REGULATOR_RT5759 is not set
>CONFIG_REGULATOR_RT6160=y
># CONFIG_REGULATOR_RT6190 is not set
>CONFIG_REGULATOR_RT6245=y
># CONFIG_REGULATOR_RTQ2134 is not set
># CONFIG_REGULATOR_RTMV20 is not set
>CONFIG_REGULATOR_RTQ6752=y
>CONFIG_REGULATOR_S2MPA01=y
># CONFIG_REGULATOR_S2MPS11 is not set
># CONFIG_REGULATOR_S5M8767 is not set
>CONFIG_REGULATOR_SKY81452=y
>CONFIG_REGULATOR_SLG51000=y
># CONFIG_REGULATOR_STPMIC1 is not set
>CONFIG_REGULATOR_SY7636A=y
>CONFIG_REGULATOR_SY8106A=y
>CONFIG_REGULATOR_SY8824X=y
>CONFIG_REGULATOR_SY8827N=y
>CONFIG_REGULATOR_TPS51632=y
>CONFIG_REGULATOR_TPS62360=y
>CONFIG_REGULATOR_TPS6286X=y
>CONFIG_REGULATOR_TPS65023=y
>CONFIG_REGULATOR_TPS6507X=y
>CONFIG_REGULATOR_TPS65086=y
># CONFIG_REGULATOR_TPS65090 is not set
># CONFIG_REGULATOR_TPS65132 is not set
># CONFIG_REGULATOR_TPS65217 is not set
>CONFIG_REGULATOR_TPS65218=y
># CONFIG_REGULATOR_TPS6586X is not set
>CONFIG_REGULATOR_TPS65910=y
>CONFIG_REGULATOR_VCTRL=y
>CONFIG_REGULATOR_WM8350=y
># CONFIG_REGULATOR_WM8994 is not set
># CONFIG_REGULATOR_QCOM_LABIBB is not set
># CONFIG_RC_CORE is not set
>
>#
># CEC support
>#
># CONFIG_MEDIA_CEC_SUPPORT is not set
># end of CEC support
>
># CONFIG_MEDIA_SUPPORT is not set
>
>#
># Graphics support
>#
># CONFIG_AGP is not set
># CONFIG_VGA_SWITCHEROO is not set
># CONFIG_DRM is not set
>CONFIG_DRM_DEBUG_MODESET_LOCK=y
>
>#
># ARM devices
>#
># end of ARM devices
>
>#
># Frame buffer Devices
>#
># CONFIG_FB is not set
># end of Frame buffer Devices
>
>#
># Backlight & LCD device support
>#
># CONFIG_LCD_CLASS_DEVICE is not set
>CONFIG_BACKLIGHT_CLASS_DEVICE=y
>CONFIG_BACKLIGHT_KTD253=y
># CONFIG_BACKLIGHT_KTZ8866 is not set
>CONFIG_BACKLIGHT_LM3533=y
>CONFIG_BACKLIGHT_PWM=y
># CONFIG_BACKLIGHT_DA903X is not set
>CONFIG_BACKLIGHT_MT6370=y
># CONFIG_BACKLIGHT_APPLE is not set
># CONFIG_BACKLIGHT_QCOM_WLED is not set
># CONFIG_BACKLIGHT_RT4831 is not set
># CONFIG_BACKLIGHT_SAHARA is not set
>CONFIG_BACKLIGHT_ADP8860=y
># CONFIG_BACKLIGHT_ADP8870 is not set
>CONFIG_BACKLIGHT_88PM860X=y
>CONFIG_BACKLIGHT_LM3630A=y
># CONFIG_BACKLIGHT_LM3639 is not set
>CONFIG_BACKLIGHT_LP855X=y
>CONFIG_BACKLIGHT_LP8788=y
>CONFIG_BACKLIGHT_SKY81452=y
>CONFIG_BACKLIGHT_TPS65217=y
># CONFIG_BACKLIGHT_AS3711 is not set
>CONFIG_BACKLIGHT_GPIO=y
># CONFIG_BACKLIGHT_LV5207LP is not set
># CONFIG_BACKLIGHT_BD6107 is not set
>CONFIG_BACKLIGHT_ARCXCNN=y
>CONFIG_BACKLIGHT_LED=y
># end of Backlight & LCD device support
># end of Graphics support
>
>CONFIG_SOUND=y
>CONFIG_SOUND_OSS_CORE=y
>CONFIG_SOUND_OSS_CORE_PRECLAIM=y
>CONFIG_SND=y
>CONFIG_SND_TIMER=y
>CONFIG_SND_PCM=y
>CONFIG_SND_HWDEP=y
>CONFIG_SND_SEQ_DEVICE=y
>CONFIG_SND_RAWMIDI=y
>CONFIG_SND_JACK=y
>CONFIG_SND_JACK_INPUT_DEV=y
>CONFIG_SND_OSSEMUL=y
>CONFIG_SND_MIXER_OSS=y
>CONFIG_SND_PCM_OSS=y
>CONFIG_SND_PCM_OSS_PLUGINS=y
>CONFIG_SND_PCM_TIMER=y
># CONFIG_SND_HRTIMER is not set
># CONFIG_SND_DYNAMIC_MINORS is not set
># CONFIG_SND_SUPPORT_OLD_API is not set
>CONFIG_SND_PROC_FS=y
># CONFIG_SND_VERBOSE_PROCFS is not set
># CONFIG_SND_VERBOSE_PRINTK is not set
># CONFIG_SND_CTL_FAST_LOOKUP is not set
>CONFIG_SND_DEBUG=y
># CONFIG_SND_DEBUG_VERBOSE is not set
>CONFIG_SND_CTL_INPUT_VALIDATION=y
>CONFIG_SND_CTL_DEBUG=y
># CONFIG_SND_JACK_INJECTION_DEBUG is not set
>CONFIG_SND_DMA_SGBUF=y
>CONFIG_SND_SEQUENCER=y
># CONFIG_SND_SEQ_DUMMY is not set
>CONFIG_SND_SEQUENCER_OSS=y
>CONFIG_SND_SEQ_MIDI_EVENT=y
>CONFIG_SND_SEQ_MIDI=y
>CONFIG_SND_SEQ_MIDI_EMUL=y
>CONFIG_SND_SEQ_VIRMIDI=y
>CONFIG_SND_MPU401_UART=y
>CONFIG_SND_OPL3_LIB=y
>CONFIG_SND_OPL4_LIB=y
>CONFIG_SND_OPL3_LIB_SEQ=y
>CONFIG_SND_OPL4_LIB_SEQ=y
># CONFIG_SND_DRIVERS is not set
>CONFIG_SND_WSS_LIB=y
>CONFIG_SND_SB_COMMON=y
>CONFIG_SND_SB8_DSP=y
>CONFIG_SND_SB16_DSP=y
>CONFIG_SND_ISA=y
>CONFIG_SND_ADLIB=y
>CONFIG_SND_AD1816A=y
>CONFIG_SND_AD1848=y
>CONFIG_SND_ALS100=y
># CONFIG_SND_AZT1605 is not set
># CONFIG_SND_AZT2316 is not set
>CONFIG_SND_AZT2320=y
># CONFIG_SND_CMI8328 is not set
>CONFIG_SND_CMI8330=y
># CONFIG_SND_CS4231 is not set
># CONFIG_SND_CS4236 is not set
>CONFIG_SND_ES1688=y
>CONFIG_SND_ES18XX=y
># CONFIG_SND_SC6000 is not set
>CONFIG_SND_GUSCLASSIC=y
># CONFIG_SND_GUSEXTREME is not set
>CONFIG_SND_GUSMAX=y
># CONFIG_SND_INTERWAVE is not set
># CONFIG_SND_INTERWAVE_STB is not set
>CONFIG_SND_JAZZ16=y
># CONFIG_SND_OPL3SA2 is not set
>CONFIG_SND_OPTI92X_AD1848=y
>CONFIG_SND_OPTI92X_CS4231=y
>CONFIG_SND_OPTI93X=y
>CONFIG_SND_MIRO=y
>CONFIG_SND_SB8=y
># CONFIG_SND_SB16 is not set
>CONFIG_SND_SBAWE=y
>CONFIG_SND_SBAWE_SEQ=y
># CONFIG_SND_SB16_CSP is not set
>CONFIG_SND_SSCAPE=y
>CONFIG_SND_WAVEFRONT=y
># CONFIG_SND_MSND_PINNACLE is not set
># CONFIG_SND_MSND_CLASSIC is not set
>CONFIG_SND_PCI=y
># CONFIG_SND_AD1889 is not set
># CONFIG_SND_ALS300 is not set
># CONFIG_SND_ALS4000 is not set
># CONFIG_SND_ALI5451 is not set
># CONFIG_SND_ASIHPI is not set
># CONFIG_SND_ATIIXP is not set
># CONFIG_SND_ATIIXP_MODEM is not set
># CONFIG_SND_AU8810 is not set
># CONFIG_SND_AU8820 is not set
># CONFIG_SND_AU8830 is not set
># CONFIG_SND_AW2 is not set
># CONFIG_SND_AZT3328 is not set
># CONFIG_SND_BT87X is not set
># CONFIG_SND_CA0106 is not set
># CONFIG_SND_CMIPCI is not set
># CONFIG_SND_OXYGEN is not set
># CONFIG_SND_CS4281 is not set
># CONFIG_SND_CS46XX is not set
># CONFIG_SND_CS5530 is not set
># CONFIG_SND_CS5535AUDIO is not set
># CONFIG_SND_CTXFI is not set
># CONFIG_SND_DARLA20 is not set
># CONFIG_SND_GINA20 is not set
># CONFIG_SND_LAYLA20 is not set
># CONFIG_SND_DARLA24 is not set
># CONFIG_SND_GINA24 is not set
># CONFIG_SND_LAYLA24 is not set
># CONFIG_SND_MONA is not set
># CONFIG_SND_MIA is not set
># CONFIG_SND_ECHO3G is not set
># CONFIG_SND_INDIGO is not set
># CONFIG_SND_INDIGOIO is not set
># CONFIG_SND_INDIGODJ is not set
># CONFIG_SND_INDIGOIOX is not set
># CONFIG_SND_INDIGODJX is not set
># CONFIG_SND_EMU10K1 is not set
># CONFIG_SND_EMU10K1X is not set
># CONFIG_SND_ENS1370 is not set
># CONFIG_SND_ENS1371 is not set
># CONFIG_SND_ES1938 is not set
># CONFIG_SND_ES1968 is not set
># CONFIG_SND_FM801 is not set
># CONFIG_SND_HDSP is not set
># CONFIG_SND_HDSPM is not set
># CONFIG_SND_ICE1712 is not set
># CONFIG_SND_ICE1724 is not set
># CONFIG_SND_INTEL8X0 is not set
># CONFIG_SND_INTEL8X0M is not set
># CONFIG_SND_KORG1212 is not set
># CONFIG_SND_LOLA is not set
># CONFIG_SND_LX6464ES is not set
># CONFIG_SND_MAESTRO3 is not set
># CONFIG_SND_MIXART is not set
># CONFIG_SND_NM256 is not set
># CONFIG_SND_PCXHR is not set
># CONFIG_SND_RIPTIDE is not set
># CONFIG_SND_RME32 is not set
># CONFIG_SND_RME96 is not set
># CONFIG_SND_RME9652 is not set
># CONFIG_SND_SE6X is not set
># CONFIG_SND_SIS7019 is not set
># CONFIG_SND_SONICVIBES is not set
># CONFIG_SND_TRIDENT is not set
># CONFIG_SND_VIA82XX is not set
># CONFIG_SND_VIA82XX_MODEM is not set
># CONFIG_SND_VIRTUOSO is not set
># CONFIG_SND_VX222 is not set
># CONFIG_SND_YMFPCI is not set
>
>#
># HD-Audio
>#
># CONFIG_SND_HDA_INTEL is not set
># end of HD-Audio
>
>CONFIG_SND_HDA_PREALLOC_SIZE=0
># CONFIG_SND_FIREWIRE is not set
># CONFIG_SND_SOC is not set
># CONFIG_SND_X86 is not set
>CONFIG_SND_SYNTH_EMUX=y
>CONFIG_SND_VIRTIO=y
>CONFIG_HID_SUPPORT=y
>CONFIG_HID=y
># CONFIG_HID_BATTERY_STRENGTH is not set
># CONFIG_HIDRAW is not set
># CONFIG_UHID is not set
>CONFIG_HID_GENERIC=y
>
>#
># Special HID drivers
>#
># CONFIG_HID_A4TECH is not set
># CONFIG_HID_ACRUX is not set
># CONFIG_HID_APPLE is not set
># CONFIG_HID_AUREAL is not set
># CONFIG_HID_BELKIN is not set
># CONFIG_HID_CHERRY is not set
># CONFIG_HID_COUGAR is not set
># CONFIG_HID_MACALLY is not set
># CONFIG_HID_CMEDIA is not set
># CONFIG_HID_CYPRESS is not set
># CONFIG_HID_DRAGONRISE is not set
># CONFIG_HID_EMS_FF is not set
># CONFIG_HID_ELECOM is not set
># CONFIG_HID_EVISION is not set
># CONFIG_HID_EZKEY is not set
># CONFIG_HID_GEMBIRD is not set
># CONFIG_HID_GFRM is not set
># CONFIG_HID_GLORIOUS is not set
># CONFIG_HID_VIVALDI is not set
># CONFIG_HID_KEYTOUCH is not set
># CONFIG_HID_KYE is not set
># CONFIG_HID_WALTOP is not set
># CONFIG_HID_VIEWSONIC is not set
># CONFIG_HID_VRC2 is not set
># CONFIG_HID_XIAOMI is not set
># CONFIG_HID_GYRATION is not set
># CONFIG_HID_ICADE is not set
># CONFIG_HID_ITE is not set
># CONFIG_HID_JABRA is not set
># CONFIG_HID_TWINHAN is not set
># CONFIG_HID_KENSINGTON is not set
># CONFIG_HID_LCPOWER is not set
># CONFIG_HID_LED is not set
># CONFIG_HID_LENOVO is not set
># CONFIG_HID_MAGICMOUSE is not set
># CONFIG_HID_MALTRON is not set
># CONFIG_HID_MAYFLASH is not set
># CONFIG_HID_REDRAGON is not set
># CONFIG_HID_MICROSOFT is not set
># CONFIG_HID_MONTEREY is not set
># CONFIG_HID_MULTITOUCH is not set
># CONFIG_HID_NINTENDO is not set
># CONFIG_HID_NTI is not set
># CONFIG_HID_ORTEK is not set
># CONFIG_HID_PANTHERLORD is not set
># CONFIG_HID_PETALYNX is not set
># CONFIG_HID_PICOLCD is not set
># CONFIG_HID_PLANTRONICS is not set
># CONFIG_HID_PLAYSTATION is not set
># CONFIG_HID_PXRC is not set
># CONFIG_HID_RAZER is not set
># CONFIG_HID_PRIMAX is not set
># CONFIG_HID_SAITEK is not set
># CONFIG_HID_SEMITEK is not set
># CONFIG_HID_SPEEDLINK is not set
># CONFIG_HID_STEAM is not set
># CONFIG_HID_STEELSERIES is not set
># CONFIG_HID_SUNPLUS is not set
># CONFIG_HID_RMI is not set
># CONFIG_HID_GREENASIA is not set
># CONFIG_HID_SMARTJOYPLUS is not set
># CONFIG_HID_TIVO is not set
># CONFIG_HID_TOPSEED is not set
># CONFIG_HID_TOPRE is not set
># CONFIG_HID_THINGM is not set
># CONFIG_HID_UDRAW_PS3 is not set
># CONFIG_HID_WIIMOTE is not set
># CONFIG_HID_XINMO is not set
># CONFIG_HID_ZEROPLUS is not set
># CONFIG_HID_ZYDACRON is not set
># CONFIG_HID_SENSOR_HUB is not set
># CONFIG_HID_ALPS is not set
># end of Special HID drivers
>
>#
># HID-BPF support
>#
># CONFIG_HID_BPF is not set
># end of HID-BPF support
>
>CONFIG_I2C_HID=y
># CONFIG_I2C_HID_ACPI is not set
># CONFIG_I2C_HID_OF is not set
># CONFIG_I2C_HID_OF_ELAN is not set
># CONFIG_I2C_HID_OF_GOODIX is not set
>CONFIG_USB_OHCI_LITTLE_ENDIAN=y
>CONFIG_USB_SUPPORT=y
># CONFIG_USB_ULPI_BUS is not set
># CONFIG_USB_CONN_GPIO is not set
>CONFIG_USB_ARCH_HAS_HCD=y
># CONFIG_USB is not set
>CONFIG_USB_PCI=y
>
>#
># USB dual-mode controller drivers
>#
>
>#
># USB port drivers
>#
>
>#
># USB Physical Layer drivers
>#
># CONFIG_NOP_USB_XCEIV is not set
># CONFIG_USB_GPIO_VBUS is not set
># end of USB Physical Layer drivers
>
># CONFIG_USB_GADGET is not set
># CONFIG_TYPEC is not set
># CONFIG_USB_ROLE_SWITCH is not set
>CONFIG_MMC=y
>CONFIG_PWRSEQ_EMMC=y
>CONFIG_PWRSEQ_SD8787=y
>CONFIG_PWRSEQ_SIMPLE=y
># CONFIG_SDIO_UART is not set
># CONFIG_MMC_TEST is not set
>
>#
># MMC/SD/SDIO Host Controller Drivers
>#
># CONFIG_MMC_DEBUG is not set
>CONFIG_MMC_SDHCI=y
>CONFIG_MMC_SDHCI_IO_ACCESSORS=y
># CONFIG_MMC_SDHCI_PCI is not set
># CONFIG_MMC_SDHCI_ACPI is not set
>CONFIG_MMC_SDHCI_PLTFM=y
>CONFIG_MMC_SDHCI_OF_ARASAN=y
>CONFIG_MMC_SDHCI_OF_AT91=y
># CONFIG_MMC_SDHCI_OF_DWCMSHC is not set
>CONFIG_MMC_SDHCI_CADENCE=y
>CONFIG_MMC_SDHCI_F_SDH30=y
># CONFIG_MMC_SDHCI_MILBEAUT is not set
># CONFIG_MMC_WBSD is not set
># CONFIG_MMC_TIFM_SD is not set
># CONFIG_MMC_CB710 is not set
># CONFIG_MMC_VIA_SDMMC is not set
>CONFIG_MMC_USDHI6ROL0=y
>CONFIG_MMC_CQHCI=y
>CONFIG_MMC_HSQ=y
># CONFIG_MMC_TOSHIBA_PCI is not set
># CONFIG_MMC_MTK is not set
>CONFIG_MMC_SDHCI_XENON=y
>CONFIG_MMC_SDHCI_OMAP=y
>CONFIG_MMC_SDHCI_AM654=y
>CONFIG_MMC_SDHCI_EXTERNAL_DMA=y
>CONFIG_MMC_LITEX=y
>CONFIG_MEMSTICK=y
>CONFIG_MEMSTICK_DEBUG=y
>
>#
># MemoryStick drivers
>#
># CONFIG_MEMSTICK_UNSAFE_RESUME is not set
>
>#
># MemoryStick Host Controller Drivers
>#
># CONFIG_MEMSTICK_TIFM_MS is not set
># CONFIG_MEMSTICK_JMICRON_38X is not set
># CONFIG_MEMSTICK_R592 is not set
>CONFIG_NEW_LEDS=y
>CONFIG_LEDS_CLASS=y
>CONFIG_LEDS_CLASS_FLASH=y
>CONFIG_LEDS_CLASS_MULTICOLOR=y
>CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y
>
>#
># LED drivers
>#
># CONFIG_LEDS_88PM860X is not set
>CONFIG_LEDS_AN30259A=y
>CONFIG_LEDS_APU=y
>CONFIG_LEDS_AW2013=y
>CONFIG_LEDS_BCM6328=y
># CONFIG_LEDS_BCM6358 is not set
>CONFIG_LEDS_LM3530=y
>CONFIG_LEDS_LM3532=y
>CONFIG_LEDS_LM3533=y
>CONFIG_LEDS_LM3642=y
>CONFIG_LEDS_LM3692X=y
>CONFIG_LEDS_MT6323=y
>CONFIG_LEDS_NET48XX=y
># CONFIG_LEDS_WRAP is not set
># CONFIG_LEDS_PCA9532 is not set
>CONFIG_LEDS_GPIO=y
>CONFIG_LEDS_LP3944=y
>CONFIG_LEDS_LP3952=y
># CONFIG_LEDS_LP50XX is not set
># CONFIG_LEDS_LP55XX_COMMON is not set
># CONFIG_LEDS_LP8788 is not set
>CONFIG_LEDS_LP8860=y
>CONFIG_LEDS_PCA955X=y
># CONFIG_LEDS_PCA955X_GPIO is not set
>CONFIG_LEDS_PCA963X=y
>CONFIG_LEDS_WM8350=y
># CONFIG_LEDS_DA903X is not set
>CONFIG_LEDS_PWM=y
># CONFIG_LEDS_REGULATOR is not set
># CONFIG_LEDS_BD2606MVV is not set
>CONFIG_LEDS_BD2802=y
># CONFIG_LEDS_INTEL_SS4200 is not set
>CONFIG_LEDS_LT3593=y
>CONFIG_LEDS_TCA6507=y
># CONFIG_LEDS_TLC591XX is not set
>CONFIG_LEDS_MAX77650=y
># CONFIG_LEDS_LM355x is not set
># CONFIG_LEDS_OT200 is not set
># CONFIG_LEDS_MENF21BMC is not set
>CONFIG_LEDS_IS31FL319X=y
>CONFIG_LEDS_IS31FL32XX=y
>
>#
># LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
>#
>CONFIG_LEDS_BLINKM=y
># CONFIG_LEDS_SYSCON is not set
># CONFIG_LEDS_MLXCPLD is not set
>CONFIG_LEDS_MLXREG=y
>CONFIG_LEDS_USER=y
># CONFIG_LEDS_NIC78BX is not set
>CONFIG_LEDS_TI_LMU_COMMON=y
>CONFIG_LEDS_LM3697=y
>CONFIG_LEDS_LM36274=y
>CONFIG_LEDS_LGM=y
>
>#
># Flash and Torch LED drivers
>#
>CONFIG_LEDS_AAT1290=y
># CONFIG_LEDS_AS3645A is not set
>CONFIG_LEDS_KTD2692=y
>CONFIG_LEDS_LM3601X=y
># CONFIG_LEDS_MT6370_FLASH is not set
>CONFIG_LEDS_RT4505=y
>CONFIG_LEDS_RT8515=y
>CONFIG_LEDS_SGM3140=y
>
>#
># RGB LED drivers
>#
># CONFIG_LEDS_PWM_MULTICOLOR is not set
># CONFIG_LEDS_QCOM_LPG is not set
># CONFIG_LEDS_MT6370_RGB is not set
>
>#
># LED Triggers
>#
>CONFIG_LEDS_TRIGGERS=y
># CONFIG_LEDS_TRIGGER_TIMER is not set
>CONFIG_LEDS_TRIGGER_ONESHOT=y
>CONFIG_LEDS_TRIGGER_MTD=y
>CONFIG_LEDS_TRIGGER_HEARTBEAT=y
>CONFIG_LEDS_TRIGGER_BACKLIGHT=y
>CONFIG_LEDS_TRIGGER_CPU=y
># CONFIG_LEDS_TRIGGER_ACTIVITY is not set
>CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
>
>#
># iptables trigger is under Netfilter config (LED target)
>#
># CONFIG_LEDS_TRIGGER_TRANSIENT is not set
>CONFIG_LEDS_TRIGGER_CAMERA=y
>CONFIG_LEDS_TRIGGER_PANIC=y
># CONFIG_LEDS_TRIGGER_NETDEV is not set
>CONFIG_LEDS_TRIGGER_PATTERN=y
>CONFIG_LEDS_TRIGGER_AUDIO=y
># CONFIG_LEDS_TRIGGER_TTY is not set
>
>#
># Simple LED drivers
>#
>CONFIG_ACCESSIBILITY=y
>
>#
># Speakup console speech
>#
># end of Speakup console speech
>
>CONFIG_INFINIBAND=y
>CONFIG_INFINIBAND_USER_MAD=y
>CONFIG_INFINIBAND_USER_ACCESS=y
>CONFIG_INFINIBAND_USER_MEM=y
># CONFIG_INFINIBAND_ON_DEMAND_PAGING is not set
># CONFIG_INFINIBAND_ADDR_TRANS is not set
># CONFIG_MLX4_INFINIBAND is not set
># CONFIG_INFINIBAND_MTHCA is not set
># CONFIG_INFINIBAND_OCRDMA is not set
># CONFIG_INFINIBAND_IPOIB is not set
>CONFIG_EDAC_ATOMIC_SCRUB=y
>CONFIG_EDAC_SUPPORT=y
>CONFIG_RTC_LIB=y
>CONFIG_RTC_MC146818_LIB=y
>CONFIG_RTC_CLASS=y
># CONFIG_RTC_HCTOSYS is not set
># CONFIG_RTC_SYSTOHC is not set
>CONFIG_RTC_DEBUG=y
>CONFIG_RTC_NVMEM=y
>
>#
># RTC interfaces
>#
># CONFIG_RTC_INTF_SYSFS is not set
># CONFIG_RTC_INTF_PROC is not set
>CONFIG_RTC_INTF_DEV=y
># CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
># CONFIG_RTC_DRV_TEST is not set
>
>#
># I2C RTC drivers
>#
># CONFIG_RTC_DRV_88PM860X is not set
>CONFIG_RTC_DRV_88PM80X=y
>CONFIG_RTC_DRV_ABB5ZES3=y
>CONFIG_RTC_DRV_ABEOZ9=y
>CONFIG_RTC_DRV_ABX80X=y
>CONFIG_RTC_DRV_AS3722=y
>CONFIG_RTC_DRV_DS1307=y
>CONFIG_RTC_DRV_DS1307_CENTURY=y
># CONFIG_RTC_DRV_DS1374 is not set
># CONFIG_RTC_DRV_DS1672 is not set
># CONFIG_RTC_DRV_HYM8563 is not set
>CONFIG_RTC_DRV_LP8788=y
># CONFIG_RTC_DRV_MAX6900 is not set
>CONFIG_RTC_DRV_MAX77686=y
>CONFIG_RTC_DRV_NCT3018Y=y
>CONFIG_RTC_DRV_RS5C372=y
># CONFIG_RTC_DRV_ISL1208 is not set
>CONFIG_RTC_DRV_ISL12022=y
># CONFIG_RTC_DRV_ISL12026 is not set
># CONFIG_RTC_DRV_X1205 is not set
># CONFIG_RTC_DRV_PCF8523 is not set
># CONFIG_RTC_DRV_PCF85063 is not set
>CONFIG_RTC_DRV_PCF85363=y
>CONFIG_RTC_DRV_PCF8563=y
># CONFIG_RTC_DRV_PCF8583 is not set
>CONFIG_RTC_DRV_M41T80=y
>CONFIG_RTC_DRV_M41T80_WDT=y
># CONFIG_RTC_DRV_BQ32K is not set
>CONFIG_RTC_DRV_PALMAS=y
># CONFIG_RTC_DRV_TPS6586X is not set
>CONFIG_RTC_DRV_TPS65910=y
>CONFIG_RTC_DRV_RC5T583=y
>CONFIG_RTC_DRV_RC5T619=y
>CONFIG_RTC_DRV_S35390A=y
>CONFIG_RTC_DRV_FM3130=y
>CONFIG_RTC_DRV_RX8010=y
>CONFIG_RTC_DRV_RX8581=y
># CONFIG_RTC_DRV_RX8025 is not set
># CONFIG_RTC_DRV_EM3027 is not set
>CONFIG_RTC_DRV_RV3028=y
>CONFIG_RTC_DRV_RV3032=y
>CONFIG_RTC_DRV_RV8803=y
>CONFIG_RTC_DRV_S5M=y
># CONFIG_RTC_DRV_SD3078 is not set
>
>#
># SPI RTC drivers
>#
>CONFIG_RTC_I2C_AND_SPI=y
>
>#
># SPI and I2C RTC drivers
>#
># CONFIG_RTC_DRV_DS3232 is not set
>CONFIG_RTC_DRV_PCF2127=y
># CONFIG_RTC_DRV_RV3029C2 is not set
>CONFIG_RTC_DRV_RX6110=y
>
>#
># Platform RTC drivers
>#
># CONFIG_RTC_DRV_CMOS is not set
>CONFIG_RTC_DRV_DS1286=y
># CONFIG_RTC_DRV_DS1511 is not set
># CONFIG_RTC_DRV_DS1553 is not set
>CONFIG_RTC_DRV_DS1685_FAMILY=y
># CONFIG_RTC_DRV_DS1685 is not set
># CONFIG_RTC_DRV_DS1689 is not set
># CONFIG_RTC_DRV_DS17285 is not set
>CONFIG_RTC_DRV_DS17485=y
># CONFIG_RTC_DRV_DS17885 is not set
>CONFIG_RTC_DRV_DS1742=y
>CONFIG_RTC_DRV_DS2404=y
># CONFIG_RTC_DRV_DA9063 is not set
>CONFIG_RTC_DRV_STK17TA8=y
># CONFIG_RTC_DRV_M48T86 is not set
>CONFIG_RTC_DRV_M48T35=y
>CONFIG_RTC_DRV_M48T59=y
>CONFIG_RTC_DRV_MSM6242=y
>CONFIG_RTC_DRV_BQ4802=y
>CONFIG_RTC_DRV_RP5C01=y
># CONFIG_RTC_DRV_WM8350 is not set
># CONFIG_RTC_DRV_ZYNQMP is not set
>CONFIG_RTC_DRV_CROS_EC=y
># CONFIG_RTC_DRV_NTXEC is not set
>
>#
># on-CPU RTC drivers
>#
># CONFIG_RTC_DRV_CADENCE is not set
>CONFIG_RTC_DRV_FTRTC010=y
>CONFIG_RTC_DRV_MT6397=y
>CONFIG_RTC_DRV_R7301=y
>
>#
># HID Sensor RTC drivers
>#
>CONFIG_RTC_DRV_GOLDFISH=y
>CONFIG_RTC_DRV_WILCO_EC=y
>CONFIG_DMADEVICES=y
>CONFIG_DMADEVICES_DEBUG=y
># CONFIG_DMADEVICES_VDEBUG is not set
>
>#
># DMA Devices
>#
>CONFIG_DMA_ENGINE=y
>CONFIG_DMA_VIRTUAL_CHANNELS=y
>CONFIG_DMA_ACPI=y
>CONFIG_DMA_OF=y
>CONFIG_ALTERA_MSGDMA=y
># CONFIG_DW_AXI_DMAC is not set
>CONFIG_FSL_EDMA=y
>CONFIG_INTEL_IDMA64=y
># CONFIG_PCH_DMA is not set
># CONFIG_PLX_DMA is not set
># CONFIG_XILINX_XDMA is not set
>CONFIG_XILINX_ZYNQMP_DPDMA=y
>CONFIG_QCOM_HIDMA_MGMT=y
>CONFIG_QCOM_HIDMA=y
>CONFIG_DW_DMAC_CORE=y
>CONFIG_DW_DMAC=y
># CONFIG_DW_DMAC_PCI is not set
>CONFIG_HSU_DMA=y
>CONFIG_SF_PDMA=y
># CONFIG_INTEL_LDMA is not set
>
>#
># DMA Clients
>#
># CONFIG_ASYNC_TX_DMA is not set
>CONFIG_DMATEST=y
>CONFIG_DMA_ENGINE_RAID=y
>
>#
># DMABUF options
>#
>CONFIG_SYNC_FILE=y
>CONFIG_SW_SYNC=y
>CONFIG_UDMABUF=y
># CONFIG_DMABUF_MOVE_NOTIFY is not set
># CONFIG_DMABUF_DEBUG is not set
># CONFIG_DMABUF_SELFTESTS is not set
># CONFIG_DMABUF_HEAPS is not set
># CONFIG_DMABUF_SYSFS_STATS is not set
># end of DMABUF options
>
># CONFIG_AUXDISPLAY is not set
># CONFIG_UIO is not set
>CONFIG_VFIO=y
>CONFIG_VFIO_CONTAINER=y
>CONFIG_VFIO_IOMMU_TYPE1=y
># CONFIG_VFIO_NOIOMMU is not set
>CONFIG_VFIO_PCI_MMAP=y
>CONFIG_VFIO_PCI_INTX=y
># CONFIG_VFIO_PCI is not set
>CONFIG_IRQ_BYPASS_MANAGER=y
># CONFIG_VIRT_DRIVERS is not set
>CONFIG_VIRTIO_ANCHOR=y
>CONFIG_VIRTIO=y
># CONFIG_VIRTIO_MENU is not set
>CONFIG_VDPA=y
>CONFIG_VDPA_USER=y
># CONFIG_MLX5_VDPA_STEERING_DEBUG is not set
>CONFIG_VHOST_IOTLB=y
>CONFIG_VHOST_TASK=y
>CONFIG_VHOST=y
>CONFIG_VHOST_MENU=y
># CONFIG_VHOST_NET is not set
>CONFIG_VHOST_VDPA=y
># CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
>
>#
># Microsoft Hyper-V guest support
>#
># end of Microsoft Hyper-V guest support
>
>CONFIG_GREYBUS=y
># CONFIG_COMEDI is not set
>CONFIG_STAGING=y
>CONFIG_STAGING_MEDIA=y
># CONFIG_STAGING_BOARD is not set
># CONFIG_MOST_COMPONENTS is not set
># CONFIG_GREYBUS_BOOTROM is not set
># CONFIG_GREYBUS_HID is not set
>CONFIG_GREYBUS_LIGHT=y
># CONFIG_GREYBUS_LOG is not set
># CONFIG_GREYBUS_LOOPBACK is not set
>CONFIG_GREYBUS_POWER=y
>CONFIG_GREYBUS_RAW=y
>CONFIG_GREYBUS_VIBRATOR=y
># CONFIG_GREYBUS_BRIDGED_PHY is not set
># CONFIG_XIL_AXIS_FIFO is not set
>CONFIG_FIELDBUS_DEV=y
>CONFIG_HMS_ANYBUSS_BUS=y
>CONFIG_ARCX_ANYBUS_CONTROLLER=y
>CONFIG_HMS_PROFINET=y
># CONFIG_QLGE is not set
># CONFIG_VME_BUS is not set
>CONFIG_CHROME_PLATFORMS=y
>CONFIG_CHROMEOS_ACPI=y
>CONFIG_CHROMEOS_LAPTOP=y
>CONFIG_CHROMEOS_PSTORE=y
># CONFIG_CHROMEOS_TBMC is not set
>CONFIG_CROS_EC=y
>CONFIG_CROS_EC_I2C=y
>CONFIG_CROS_EC_RPMSG=y
>CONFIG_CROS_EC_LPC=y
>CONFIG_CROS_EC_PROTO=y
># CONFIG_CROS_KBD_LED_BACKLIGHT is not set
>CONFIG_CROS_EC_CHARDEV=y
># CONFIG_CROS_EC_LIGHTBAR is not set
>CONFIG_CROS_EC_VBC=y
>CONFIG_CROS_EC_DEBUGFS=y
>CONFIG_CROS_EC_SENSORHUB=y
># CONFIG_CROS_EC_SYSFS is not set
># CONFIG_CROS_HPS_I2C is not set
>CONFIG_CROS_USBPD_LOGGER=y
>CONFIG_CROS_USBPD_NOTIFY=y
>CONFIG_WILCO_EC=y
>CONFIG_WILCO_EC_DEBUGFS=y
># CONFIG_WILCO_EC_EVENTS is not set
>CONFIG_WILCO_EC_TELEMETRY=y
>CONFIG_MELLANOX_PLATFORM=y
># CONFIG_MLXREG_HOTPLUG is not set
>CONFIG_MLXREG_IO=y
># CONFIG_MLXREG_LC is not set
># CONFIG_NVSW_SN2201 is not set
>CONFIG_SURFACE_PLATFORMS=y
># CONFIG_SURFACE_3_POWER_OPREGION is not set
>CONFIG_SURFACE_GPE=y
>CONFIG_SURFACE_HOTPLUG=y
># CONFIG_SURFACE_PRO3_BUTTON is not set
>CONFIG_X86_PLATFORM_DEVICES=y
>CONFIG_ACPI_WMI=y
>CONFIG_WMI_BMOF=y
># CONFIG_HUAWEI_WMI is not set
>CONFIG_MXM_WMI=y
># CONFIG_XIAOMI_WMI is not set
>CONFIG_GIGABYTE_WMI=y
># CONFIG_YOGABOOK_WMI is not set
># CONFIG_ACERHDF is not set
># CONFIG_ACER_WIRELESS is not set
># CONFIG_ACER_WMI is not set
># CONFIG_ADV_SWBUTTON is not set
># CONFIG_APPLE_GMUX is not set
># CONFIG_ASUS_LAPTOP is not set
># CONFIG_ASUS_WIRELESS is not set
># CONFIG_ASUS_TF103C_DOCK is not set
>CONFIG_X86_PLATFORM_DRIVERS_DELL=y
>CONFIG_ALIENWARE_WMI=y
>CONFIG_DCDBAS=y
>CONFIG_DELL_LAPTOP=m
>CONFIG_DELL_RBU=y
>CONFIG_DELL_SMBIOS=y
>CONFIG_DELL_SMBIOS_WMI=y
># CONFIG_DELL_SMBIOS_SMM is not set
>CONFIG_DELL_SMO8800=y
>CONFIG_DELL_WMI=m
># CONFIG_DELL_WMI_PRIVACY is not set
>CONFIG_DELL_WMI_AIO=m
>CONFIG_DELL_WMI_DESCRIPTOR=y
>CONFIG_DELL_WMI_DDV=m
># CONFIG_DELL_WMI_LED is not set
>CONFIG_DELL_WMI_SYSMAN=y
># CONFIG_FUJITSU_LAPTOP is not set
># CONFIG_FUJITSU_TABLET is not set
>CONFIG_GPD_POCKET_FAN=y
># CONFIG_X86_PLATFORM_DRIVERS_HP is not set
># CONFIG_WIRELESS_HOTKEY is not set
># CONFIG_IBM_RTL is not set
># CONFIG_LENOVO_YMC is not set
># CONFIG_SENSORS_HDAPS is not set
># CONFIG_THINKPAD_LMI is not set
>CONFIG_INTEL_ATOMISP2_PDX86=y
>CONFIG_INTEL_ATOMISP2_LED=y
># CONFIG_INTEL_SAR_INT1092 is not set
># CONFIG_INTEL_SKL_INT3472 is not set
># CONFIG_INTEL_PMC_CORE is not set
># CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
># CONFIG_INTEL_WMI_THUNDERBOLT is not set
># CONFIG_INTEL_HID_EVENT is not set
># CONFIG_INTEL_VBTN is not set
># CONFIG_INTEL_INT0002_VGPIO is not set
># CONFIG_INTEL_MRFLD_PWRBTN is not set
>CONFIG_INTEL_PUNIT_IPC=y
># CONFIG_INTEL_RST is not set
>CONFIG_INTEL_SMARTCONNECT=y
># CONFIG_INTEL_VSEC is not set
># CONFIG_MSI_EC is not set
># CONFIG_MSI_WMI is not set
># CONFIG_PCENGINES_APU2 is not set
>CONFIG_BARCO_P50_GPIO=y
># CONFIG_SAMSUNG_LAPTOP is not set
>CONFIG_SAMSUNG_Q10=y
># CONFIG_TOSHIBA_BT_RFKILL is not set
># CONFIG_TOSHIBA_HAPS is not set
># CONFIG_TOSHIBA_WMI is not set
># CONFIG_ACPI_CMPC is not set
># CONFIG_LG_LAPTOP is not set
># CONFIG_PANASONIC_LAPTOP is not set
># CONFIG_SYSTEM76_ACPI is not set
># CONFIG_TOPSTAR_LAPTOP is not set
>CONFIG_MLX_PLATFORM=y
>CONFIG_FW_ATTR_CLASS=y
># CONFIG_INTEL_IPS is not set
>CONFIG_INTEL_SCU_IPC=y
>CONFIG_INTEL_SCU=y
># CONFIG_INTEL_SCU_PCI is not set
>CONFIG_INTEL_SCU_PLATFORM=y
>CONFIG_INTEL_SCU_IPC_UTIL=y
># CONFIG_SIEMENS_SIMATIC_IPC is not set
># CONFIG_WINMATE_FM07_KEYS is not set
># CONFIG_P2SB is not set
>CONFIG_HAVE_CLK=y
>CONFIG_HAVE_CLK_PREPARE=y
>CONFIG_COMMON_CLK=y
>CONFIG_COMMON_CLK_MAX77686=y
>CONFIG_COMMON_CLK_MAX9485=y
># CONFIG_COMMON_CLK_SI5341 is not set
>CONFIG_COMMON_CLK_SI5351=y
>CONFIG_COMMON_CLK_SI514=y
># CONFIG_COMMON_CLK_SI544 is not set
>CONFIG_COMMON_CLK_SI570=y
>CONFIG_COMMON_CLK_CDCE706=y
>CONFIG_COMMON_CLK_CDCE925=y
>CONFIG_COMMON_CLK_CS2000_CP=y
>CONFIG_COMMON_CLK_S2MPS11=y
># CONFIG_CLK_TWL6040 is not set
># CONFIG_COMMON_CLK_AXI_CLKGEN is not set
>CONFIG_COMMON_CLK_PALMAS=y
># CONFIG_COMMON_CLK_PWM is not set
># CONFIG_COMMON_CLK_RS9_PCIE is not set
># CONFIG_COMMON_CLK_SI521XX is not set
>CONFIG_COMMON_CLK_VC5=y
>CONFIG_COMMON_CLK_VC7=y
># CONFIG_COMMON_CLK_FIXED_MMIO is not set
>CONFIG_CLK_LGM_CGU=y
># CONFIG_XILINX_VCU is not set
># CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
># CONFIG_HWSPINLOCK is not set
>
>#
># Clock Source drivers
>#
>CONFIG_CLKSRC_I8253=y
>CONFIG_CLKEVT_I8253=y
>CONFIG_I8253_LOCK=y
>CONFIG_CLKBLD_I8253=y
># end of Clock Source drivers
>
>CONFIG_MAILBOX=y
>CONFIG_PLATFORM_MHU=y
># CONFIG_PCC is not set
>CONFIG_ALTERA_MBOX=y
># CONFIG_MAILBOX_TEST is not set
>CONFIG_IOMMU_IOVA=y
>CONFIG_IOMMU_API=y
>CONFIG_IOMMU_SUPPORT=y
>
>#
># Generic IOMMU Pagetable Support
>#
># end of Generic IOMMU Pagetable Support
>
># CONFIG_IOMMU_DEBUGFS is not set
># CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
>CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
># CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
>CONFIG_OF_IOMMU=y
>CONFIG_IOMMU_DMA=y
># CONFIG_IOMMUFD is not set
># CONFIG_VIRTIO_IOMMU is not set
>
>#
># Remoteproc drivers
>#
># CONFIG_REMOTEPROC is not set
># end of Remoteproc drivers
>
>#
># Rpmsg drivers
>#
>CONFIG_RPMSG=y
>CONFIG_RPMSG_CHAR=y
>CONFIG_RPMSG_CTRL=y
>CONFIG_RPMSG_NS=y
>CONFIG_RPMSG_QCOM_GLINK=y
>CONFIG_RPMSG_QCOM_GLINK_RPM=y
>CONFIG_RPMSG_VIRTIO=y
># end of Rpmsg drivers
>
># CONFIG_SOUNDWIRE is not set
>
>#
># SOC (System On Chip) specific Drivers
>#
>
>#
># Amlogic SoC drivers
>#
># end of Amlogic SoC drivers
>
>#
># Broadcom SoC drivers
>#
># end of Broadcom SoC drivers
>
>#
># NXP/Freescale QorIQ SoC drivers
>#
># end of NXP/Freescale QorIQ SoC drivers
>
>#
># fujitsu SoC drivers
>#
># end of fujitsu SoC drivers
>
>#
># i.MX SoC drivers
>#
># end of i.MX SoC drivers
>
>#
># Enable LiteX SoC Builder specific drivers
>#
>CONFIG_LITEX=y
>CONFIG_LITEX_SOC_CONTROLLER=y
># end of Enable LiteX SoC Builder specific drivers
>
># CONFIG_WPCM450_SOC is not set
>
>#
># Qualcomm SoC drivers
>#
># end of Qualcomm SoC drivers
>
># CONFIG_SOC_TI is not set
>
>#
># Xilinx SoC drivers
>#
># end of Xilinx SoC drivers
># end of SOC (System On Chip) specific Drivers
>
>CONFIG_PM_DEVFREQ=y
>
>#
># DEVFREQ Governors
>#
>CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
># CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
># CONFIG_DEVFREQ_GOV_POWERSAVE is not set
>CONFIG_DEVFREQ_GOV_USERSPACE=y
>CONFIG_DEVFREQ_GOV_PASSIVE=y
>
>#
># DEVFREQ Drivers
>#
>CONFIG_PM_DEVFREQ_EVENT=y
>CONFIG_EXTCON=y
>
>#
># Extcon Device Drivers
>#
># CONFIG_EXTCON_FSA9480 is not set
>CONFIG_EXTCON_GPIO=y
>CONFIG_EXTCON_INTEL_INT3496=y
>CONFIG_EXTCON_INTEL_MRFLD=y
># CONFIG_EXTCON_MAX14577 is not set
>CONFIG_EXTCON_MAX3355=y
>CONFIG_EXTCON_MAX77843=y
># CONFIG_EXTCON_PALMAS is not set
># CONFIG_EXTCON_PTN5150 is not set
>CONFIG_EXTCON_RT8973A=y
># CONFIG_EXTCON_SM5502 is not set
>CONFIG_EXTCON_USB_GPIO=y
>CONFIG_EXTCON_USBC_CROS_EC=y
>CONFIG_MEMORY=y
>CONFIG_FPGA_DFL_EMIF=y
># CONFIG_IIO is not set
># CONFIG_NTB is not set
>CONFIG_PWM=y
>CONFIG_PWM_SYSFS=y
># CONFIG_PWM_DEBUG is not set
>CONFIG_PWM_ATMEL_HLCDC_PWM=y
># CONFIG_PWM_ATMEL_TCB is not set
>CONFIG_PWM_CLK=y
># CONFIG_PWM_CROS_EC is not set
># CONFIG_PWM_DWC is not set
>CONFIG_PWM_FSL_FTM=y
>CONFIG_PWM_INTEL_LGM=y
>CONFIG_PWM_IQS620A=y
># CONFIG_PWM_LP3943 is not set
>CONFIG_PWM_LPSS=y
># CONFIG_PWM_LPSS_PCI is not set
>CONFIG_PWM_LPSS_PLATFORM=y
>CONFIG_PWM_NTXEC=y
>CONFIG_PWM_PCA9685=y
># CONFIG_PWM_XILINX is not set
>
>#
># IRQ chip support
>#
>CONFIG_IRQCHIP=y
># CONFIG_AL_FIC is not set
># CONFIG_XILINX_INTC is not set
># end of IRQ chip support
>
># CONFIG_IPACK_BUS is not set
>CONFIG_RESET_CONTROLLER=y
>CONFIG_RESET_INTEL_GW=y
>CONFIG_RESET_SIMPLE=y
># CONFIG_RESET_TI_SYSCON is not set
>CONFIG_RESET_TI_TPS380X=y
>
>#
># PHY Subsystem
>#
>CONFIG_GENERIC_PHY=y
>CONFIG_GENERIC_PHY_MIPI_DPHY=y
># CONFIG_USB_LGM_PHY is not set
>CONFIG_PHY_CAN_TRANSCEIVER=y
>
>#
># PHY drivers for Broadcom platforms
>#
>CONFIG_BCM_KONA_USB2_PHY=y
># end of PHY drivers for Broadcom platforms
>
># CONFIG_PHY_CADENCE_TORRENT is not set
># CONFIG_PHY_CADENCE_DPHY is not set
>CONFIG_PHY_CADENCE_DPHY_RX=y
>CONFIG_PHY_CADENCE_SIERRA=y
>CONFIG_PHY_CADENCE_SALVO=y
>CONFIG_PHY_PXA_28NM_HSIC=y
># CONFIG_PHY_PXA_28NM_USB2 is not set
>CONFIG_PHY_LAN966X_SERDES=y
># CONFIG_PHY_MAPPHONE_MDM6600 is not set
>CONFIG_PHY_OCELOT_SERDES=y
># CONFIG_PHY_INTEL_LGM_COMBO is not set
>CONFIG_PHY_INTEL_LGM_EMMC=y
># end of PHY Subsystem
>
>CONFIG_POWERCAP=y
>CONFIG_IDLE_INJECT=y
>CONFIG_DTPM=y
>CONFIG_MCB=y
># CONFIG_MCB_PCI is not set
>CONFIG_MCB_LPC=y
>
>#
># Performance monitor support
>#
># end of Performance monitor support
>
># CONFIG_RAS is not set
># CONFIG_USB4 is not set
>
>#
># Android
>#
># CONFIG_ANDROID_BINDER_IPC is not set
># end of Android
>
>CONFIG_DAX=y
>CONFIG_NVMEM=y
>CONFIG_NVMEM_SYSFS=y
>
>#
># Layout Types
>#
># CONFIG_NVMEM_LAYOUT_SL28_VPD is not set
># CONFIG_NVMEM_LAYOUT_ONIE_TLV is not set
># end of Layout Types
>
>CONFIG_NVMEM_RMEM=y
>CONFIG_NVMEM_SPMI_SDAM=y
># CONFIG_NVMEM_U_BOOT_ENV is not set
>
>#
># HW tracing support
>#
>CONFIG_STM=y
>CONFIG_STM_PROTO_BASIC=y
>CONFIG_STM_PROTO_SYS_T=y
>CONFIG_STM_DUMMY=y
>CONFIG_STM_SOURCE_CONSOLE=y
>CONFIG_STM_SOURCE_HEARTBEAT=y
>CONFIG_STM_SOURCE_FTRACE=y
>CONFIG_INTEL_TH=y
># CONFIG_INTEL_TH_PCI is not set
>CONFIG_INTEL_TH_ACPI=y
>CONFIG_INTEL_TH_GTH=y
># CONFIG_INTEL_TH_STH is not set
>CONFIG_INTEL_TH_MSU=y
>CONFIG_INTEL_TH_PTI=y
>CONFIG_INTEL_TH_DEBUG=y
># end of HW tracing support
>
>CONFIG_FPGA=y
>CONFIG_ALTERA_PR_IP_CORE=y
>CONFIG_ALTERA_PR_IP_CORE_PLAT=y
># CONFIG_FPGA_MGR_ALTERA_CVP is not set
>CONFIG_FPGA_BRIDGE=y
>CONFIG_ALTERA_FREEZE_BRIDGE=y
>CONFIG_XILINX_PR_DECOUPLER=y
>CONFIG_FPGA_REGION=y
>CONFIG_OF_FPGA_REGION=y
>CONFIG_FPGA_DFL=y
># CONFIG_FPGA_DFL_FME is not set
># CONFIG_FPGA_DFL_AFU is not set
># CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000 is not set
># CONFIG_FPGA_DFL_PCI is not set
># CONFIG_FSI is not set
>CONFIG_MULTIPLEXER=y
>
>#
># Multiplexer drivers
>#
>CONFIG_MUX_ADG792A=y
># CONFIG_MUX_GPIO is not set
>CONFIG_MUX_MMIO=y
># end of Multiplexer drivers
>
>CONFIG_PM_OPP=y
># CONFIG_SIOX is not set
>CONFIG_SLIMBUS=y
>CONFIG_SLIM_QCOM_CTRL=y
>CONFIG_INTERCONNECT=y
>CONFIG_COUNTER=y
># CONFIG_INTEL_QEP is not set
>CONFIG_INTERRUPT_CNT=y
>CONFIG_MOST=y
># CONFIG_MOST_CDEV is not set
>CONFIG_MOST_SND=y
>CONFIG_PECI=y
>CONFIG_PECI_CPU=y
># CONFIG_HTE is not set
># end of Device Drivers
>
>#
># File systems
>#
>CONFIG_DCACHE_WORD_ACCESS=y
>CONFIG_VALIDATE_FS_PARSER=y
>CONFIG_FS_POSIX_ACL=y
>CONFIG_EXPORTFS=y
>CONFIG_EXPORTFS_BLOCK_OPS=y
>CONFIG_FILE_LOCKING=y
>CONFIG_FS_ENCRYPTION=y
>CONFIG_FS_VERITY=y
># CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
>CONFIG_FSNOTIFY=y
>CONFIG_DNOTIFY=y
>CONFIG_INOTIFY_USER=y
>CONFIG_FANOTIFY=y
># CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
>CONFIG_QUOTA=y
># CONFIG_QUOTA_NETLINK_INTERFACE is not set
># CONFIG_QUOTA_DEBUG is not set
>CONFIG_QUOTA_TREE=y
>CONFIG_QFMT_V1=y
>CONFIG_QFMT_V2=y
>CONFIG_QUOTACTL=y
>CONFIG_AUTOFS4_FS=y
>CONFIG_AUTOFS_FS=y
># CONFIG_FUSE_FS is not set
>CONFIG_OVERLAY_FS=y
>CONFIG_OVERLAY_FS_REDIRECT_DIR=y
># CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
>CONFIG_OVERLAY_FS_INDEX=y
>CONFIG_OVERLAY_FS_METACOPY=y
>
>#
># Caches
>#
># CONFIG_FSCACHE is not set
># end of Caches
>
>#
># Pseudo filesystems
>#
>CONFIG_PROC_FS=y
># CONFIG_PROC_KCORE is not set
>CONFIG_PROC_SYSCTL=y
>CONFIG_PROC_PAGE_MONITOR=y
>CONFIG_PROC_CHILDREN=y
>CONFIG_PROC_PID_ARCH_STATUS=y
>CONFIG_KERNFS=y
>CONFIG_SYSFS=y
>CONFIG_TMPFS=y
>CONFIG_TMPFS_POSIX_ACL=y
>CONFIG_TMPFS_XATTR=y
># CONFIG_HUGETLBFS is not set
>CONFIG_MEMFD_CREATE=y
>CONFIG_CONFIGFS_FS=y
>CONFIG_EFIVAR_FS=y
># end of Pseudo filesystems
>
>CONFIG_MISC_FILESYSTEMS=y
>CONFIG_ORANGEFS_FS=y
>CONFIG_ECRYPT_FS=y
>CONFIG_ECRYPT_FS_MESSAGING=y
># CONFIG_JFFS2_FS is not set
># CONFIG_UBIFS_FS is not set
>CONFIG_CRAMFS=y
>CONFIG_CRAMFS_MTD=y
>CONFIG_ROMFS_FS=y
>CONFIG_ROMFS_BACKED_BY_MTD=y
>CONFIG_ROMFS_ON_MTD=y
>CONFIG_PSTORE=y
>CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
>CONFIG_PSTORE_DEFLATE_COMPRESS=y
>CONFIG_PSTORE_LZO_COMPRESS=y
># CONFIG_PSTORE_LZ4_COMPRESS is not set
>CONFIG_PSTORE_LZ4HC_COMPRESS=y
>CONFIG_PSTORE_842_COMPRESS=y
>CONFIG_PSTORE_ZSTD_COMPRESS=y
>CONFIG_PSTORE_COMPRESS=y
># CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT is not set
>CONFIG_PSTORE_LZO_COMPRESS_DEFAULT=y
># CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
># CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
># CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
>CONFIG_PSTORE_COMPRESS_DEFAULT="lzo"
>CONFIG_PSTORE_CONSOLE=y
># CONFIG_PSTORE_PMSG is not set
># CONFIG_PSTORE_FTRACE is not set
>CONFIG_PSTORE_RAM=y
># CONFIG_NETWORK_FILESYSTEMS is not set
>CONFIG_NLS=y
>CONFIG_NLS_DEFAULT="iso8859-1"
>CONFIG_NLS_CODEPAGE_437=y
># CONFIG_NLS_CODEPAGE_737 is not set
># CONFIG_NLS_CODEPAGE_775 is not set
>CONFIG_NLS_CODEPAGE_850=y
># CONFIG_NLS_CODEPAGE_852 is not set
># CONFIG_NLS_CODEPAGE_855 is not set
># CONFIG_NLS_CODEPAGE_857 is not set
>CONFIG_NLS_CODEPAGE_860=y
># CONFIG_NLS_CODEPAGE_861 is not set
>CONFIG_NLS_CODEPAGE_862=y
># CONFIG_NLS_CODEPAGE_863 is not set
>CONFIG_NLS_CODEPAGE_864=y
>CONFIG_NLS_CODEPAGE_865=y
>CONFIG_NLS_CODEPAGE_866=y
>CONFIG_NLS_CODEPAGE_869=y
># CONFIG_NLS_CODEPAGE_936 is not set
># CONFIG_NLS_CODEPAGE_950 is not set
>CONFIG_NLS_CODEPAGE_932=y
>CONFIG_NLS_CODEPAGE_949=y
># CONFIG_NLS_CODEPAGE_874 is not set
># CONFIG_NLS_ISO8859_8 is not set
>CONFIG_NLS_CODEPAGE_1250=y
># CONFIG_NLS_CODEPAGE_1251 is not set
>CONFIG_NLS_ASCII=y
>CONFIG_NLS_ISO8859_1=y
>CONFIG_NLS_ISO8859_2=y
>CONFIG_NLS_ISO8859_3=y
>CONFIG_NLS_ISO8859_4=y
>CONFIG_NLS_ISO8859_5=y
># CONFIG_NLS_ISO8859_6 is not set
>CONFIG_NLS_ISO8859_7=y
># CONFIG_NLS_ISO8859_9 is not set
># CONFIG_NLS_ISO8859_13 is not set
>CONFIG_NLS_ISO8859_14=y
>CONFIG_NLS_ISO8859_15=y
># CONFIG_NLS_KOI8_R is not set
>CONFIG_NLS_KOI8_U=y
>CONFIG_NLS_MAC_ROMAN=y
>CONFIG_NLS_MAC_CELTIC=y
>CONFIG_NLS_MAC_CENTEURO=y
>CONFIG_NLS_MAC_CROATIAN=y
>CONFIG_NLS_MAC_CYRILLIC=y
># CONFIG_NLS_MAC_GAELIC is not set
>CONFIG_NLS_MAC_GREEK=y
># CONFIG_NLS_MAC_ICELAND is not set
>CONFIG_NLS_MAC_INUIT=y
>CONFIG_NLS_MAC_ROMANIAN=y
># CONFIG_NLS_MAC_TURKISH is not set
># CONFIG_NLS_UTF8 is not set
># CONFIG_DLM is not set
>CONFIG_UNICODE=y
># CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
># end of File systems
>
>#
># Security options
>#
>CONFIG_KEYS=y
>CONFIG_KEYS_REQUEST_CACHE=y
>CONFIG_PERSISTENT_KEYRINGS=y
>CONFIG_TRUSTED_KEYS=y
>
>#
># No trust source selected!
>#
># CONFIG_ENCRYPTED_KEYS is not set
># CONFIG_KEY_DH_OPERATIONS is not set
># CONFIG_SECURITY_DMESG_RESTRICT is not set
>CONFIG_SECURITY=y
># CONFIG_SECURITYFS is not set
># CONFIG_SECURITY_NETWORK is not set
># CONFIG_SECURITY_INFINIBAND is not set
># CONFIG_SECURITY_PATH is not set
>CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
>CONFIG_HARDENED_USERCOPY=y
># CONFIG_STATIC_USERMODEHELPER is not set
># CONFIG_SECURITY_SMACK is not set
># CONFIG_SECURITY_TOMOYO is not set
># CONFIG_SECURITY_APPARMOR is not set
># CONFIG_SECURITY_YAMA is not set
># CONFIG_SECURITY_SAFESETID is not set
># CONFIG_SECURITY_LOCKDOWN_LSM is not set
># CONFIG_SECURITY_LANDLOCK is not set
>CONFIG_INTEGRITY=y
># CONFIG_INTEGRITY_SIGNATURE is not set
># CONFIG_IMA is not set
># CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
># CONFIG_EVM is not set
>CONFIG_DEFAULT_SECURITY_DAC=y
>CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"
>
>#
># Kernel hardening options
>#
>
>#
># Memory initialization
>#
>CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
>CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_ENABLER=y
>CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
>CONFIG_INIT_STACK_NONE=y
># CONFIG_INIT_STACK_ALL_PATTERN is not set
># CONFIG_INIT_STACK_ALL_ZERO is not set
>CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
>CONFIG_INIT_ON_FREE_DEFAULT_ON=y
># end of Memory initialization
>
>CONFIG_RANDSTRUCT_NONE=y
># end of Kernel hardening options
># end of Security options
>
>CONFIG_CRYPTO=y
>
>#
># Crypto core or helper
>#
>CONFIG_CRYPTO_ALGAPI=y
>CONFIG_CRYPTO_ALGAPI2=y
>CONFIG_CRYPTO_AEAD=y
>CONFIG_CRYPTO_AEAD2=y
>CONFIG_CRYPTO_SKCIPHER=y
>CONFIG_CRYPTO_SKCIPHER2=y
>CONFIG_CRYPTO_HASH=y
>CONFIG_CRYPTO_HASH2=y
>CONFIG_CRYPTO_RNG=y
>CONFIG_CRYPTO_RNG2=y
>CONFIG_CRYPTO_RNG_DEFAULT=y
>CONFIG_CRYPTO_AKCIPHER2=y
>CONFIG_CRYPTO_AKCIPHER=y
>CONFIG_CRYPTO_KPP2=y
>CONFIG_CRYPTO_KPP=y
>CONFIG_CRYPTO_ACOMP2=y
>CONFIG_CRYPTO_MANAGER=y
>CONFIG_CRYPTO_MANAGER2=y
># CONFIG_CRYPTO_USER is not set
>CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
>CONFIG_CRYPTO_NULL=y
>CONFIG_CRYPTO_NULL2=y
>CONFIG_CRYPTO_CRYPTD=y
>CONFIG_CRYPTO_AUTHENC=y
># CONFIG_CRYPTO_TEST is not set
>CONFIG_CRYPTO_SIMD=y
>CONFIG_CRYPTO_ENGINE=y
># end of Crypto core or helper
>
>#
># Public-key cryptography
>#
># CONFIG_CRYPTO_RSA is not set
># CONFIG_CRYPTO_DH is not set
>CONFIG_CRYPTO_ECC=y
>CONFIG_CRYPTO_ECDH=y
>CONFIG_CRYPTO_ECDSA=y
># CONFIG_CRYPTO_ECRDSA is not set
>CONFIG_CRYPTO_SM2=y
>CONFIG_CRYPTO_CURVE25519=y
># end of Public-key cryptography
>
>#
># Block ciphers
>#
>CONFIG_CRYPTO_AES=y
># CONFIG_CRYPTO_AES_TI is not set
># CONFIG_CRYPTO_ARIA is not set
># CONFIG_CRYPTO_BLOWFISH is not set
># CONFIG_CRYPTO_CAMELLIA is not set
># CONFIG_CRYPTO_CAST5 is not set
># CONFIG_CRYPTO_CAST6 is not set
>CONFIG_CRYPTO_DES=y
>CONFIG_CRYPTO_FCRYPT=y
>CONFIG_CRYPTO_SERPENT=y
>CONFIG_CRYPTO_SM4=y
>CONFIG_CRYPTO_SM4_GENERIC=y
>CONFIG_CRYPTO_TWOFISH=y
>CONFIG_CRYPTO_TWOFISH_COMMON=y
># end of Block ciphers
>
>#
># Length-preserving ciphers and modes
>#
>CONFIG_CRYPTO_ADIANTUM=y
>CONFIG_CRYPTO_CHACHA20=y
>CONFIG_CRYPTO_CBC=y
>CONFIG_CRYPTO_CFB=y
>CONFIG_CRYPTO_CTR=y
># CONFIG_CRYPTO_CTS is not set
>CONFIG_CRYPTO_ECB=y
>CONFIG_CRYPTO_HCTR2=y
>CONFIG_CRYPTO_KEYWRAP=y
>CONFIG_CRYPTO_LRW=y
>CONFIG_CRYPTO_OFB=y
>CONFIG_CRYPTO_PCBC=y
>CONFIG_CRYPTO_XCTR=y
>CONFIG_CRYPTO_XTS=y
>CONFIG_CRYPTO_NHPOLY1305=y
># end of Length-preserving ciphers and modes
>
>#
># AEAD (authenticated encryption with associated data) ciphers
>#
>CONFIG_CRYPTO_AEGIS128=y
>CONFIG_CRYPTO_CHACHA20POLY1305=y
>CONFIG_CRYPTO_CCM=y
>CONFIG_CRYPTO_GCM=y
>CONFIG_CRYPTO_SEQIV=y
>CONFIG_CRYPTO_ECHAINIV=y
># CONFIG_CRYPTO_ESSIV is not set
># end of AEAD (authenticated encryption with associated data) ciphers
>
>#
># Hashes, digests, and MACs
>#
>CONFIG_CRYPTO_BLAKE2B=y
>CONFIG_CRYPTO_CMAC=y
>CONFIG_CRYPTO_GHASH=y
>CONFIG_CRYPTO_HMAC=y
>CONFIG_CRYPTO_MD4=y
>CONFIG_CRYPTO_MD5=y
>CONFIG_CRYPTO_MICHAEL_MIC=y
>CONFIG_CRYPTO_POLYVAL=y
>CONFIG_CRYPTO_POLY1305=y
># CONFIG_CRYPTO_RMD160 is not set
>CONFIG_CRYPTO_SHA1=y
>CONFIG_CRYPTO_SHA256=y
>CONFIG_CRYPTO_SHA512=y
>CONFIG_CRYPTO_SHA3=y
>CONFIG_CRYPTO_SM3=y
>CONFIG_CRYPTO_SM3_GENERIC=y
>CONFIG_CRYPTO_STREEBOG=y
># CONFIG_CRYPTO_VMAC is not set
>CONFIG_CRYPTO_WP512=y
>CONFIG_CRYPTO_XCBC=y
># CONFIG_CRYPTO_XXHASH is not set
># end of Hashes, digests, and MACs
>
>#
># CRCs (cyclic redundancy checks)
>#
>CONFIG_CRYPTO_CRC32C=y
># CONFIG_CRYPTO_CRC32 is not set
># CONFIG_CRYPTO_CRCT10DIF is not set
>CONFIG_CRYPTO_CRC64_ROCKSOFT=y
># end of CRCs (cyclic redundancy checks)
>
>#
># Compression
>#
>CONFIG_CRYPTO_DEFLATE=y
>CONFIG_CRYPTO_LZO=y
>CONFIG_CRYPTO_842=y
>CONFIG_CRYPTO_LZ4=y
>CONFIG_CRYPTO_LZ4HC=y
>CONFIG_CRYPTO_ZSTD=y
># end of Compression
>
>#
># Random number generation
>#
>CONFIG_CRYPTO_ANSI_CPRNG=y
>CONFIG_CRYPTO_DRBG_MENU=y
>CONFIG_CRYPTO_DRBG_HMAC=y
># CONFIG_CRYPTO_DRBG_HASH is not set
># CONFIG_CRYPTO_DRBG_CTR is not set
>CONFIG_CRYPTO_DRBG=y
>CONFIG_CRYPTO_JITTERENTROPY=y
># end of Random number generation
>
>#
># Userspace interface
>#
>CONFIG_CRYPTO_USER_API=y
>CONFIG_CRYPTO_USER_API_HASH=y
>CONFIG_CRYPTO_USER_API_SKCIPHER=y
>CONFIG_CRYPTO_USER_API_RNG=y
>CONFIG_CRYPTO_USER_API_RNG_CAVP=y
># CONFIG_CRYPTO_USER_API_AEAD is not set
># CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
># end of Userspace interface
>
>CONFIG_CRYPTO_HASH_INFO=y
>
>#
># Accelerated Cryptographic Algorithms for CPU (x86)
>#
># CONFIG_CRYPTO_AES_NI_INTEL is not set
>CONFIG_CRYPTO_SERPENT_SSE2_586=y
>CONFIG_CRYPTO_TWOFISH_586=y
>CONFIG_CRYPTO_CRC32C_INTEL=y
># CONFIG_CRYPTO_CRC32_PCLMUL is not set
># end of Accelerated Cryptographic Algorithms for CPU (x86)
>
>CONFIG_CRYPTO_HW=y
>CONFIG_CRYPTO_DEV_PADLOCK=y
>CONFIG_CRYPTO_DEV_PADLOCK_AES=y
>CONFIG_CRYPTO_DEV_PADLOCK_SHA=y
># CONFIG_CRYPTO_DEV_GEODE is not set
># CONFIG_CRYPTO_DEV_HIFN_795X is not set
>CONFIG_CRYPTO_DEV_ATMEL_I2C=y
>CONFIG_CRYPTO_DEV_ATMEL_ECC=y
>CONFIG_CRYPTO_DEV_ATMEL_SHA204A=y
># CONFIG_CRYPTO_DEV_CCP is not set
># CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
># CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
># CONFIG_CRYPTO_DEV_QAT_C62X is not set
># CONFIG_CRYPTO_DEV_QAT_4XXX is not set
># CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
># CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
># CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
># CONFIG_CRYPTO_DEV_VIRTIO is not set
>CONFIG_CRYPTO_DEV_SAFEXCEL=y
>CONFIG_CRYPTO_DEV_CCREE=y
>CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
>CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG=y
># CONFIG_ASYMMETRIC_KEY_TYPE is not set
>
>#
># Certificates for signature checking
>#
># CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
># end of Certificates for signature checking
>
>CONFIG_BINARY_PRINTF=y
>
>#
># Library routines
>#
>CONFIG_LINEAR_RANGES=y
>CONFIG_PACKING=y
>CONFIG_BITREVERSE=y
>CONFIG_GENERIC_STRNCPY_FROM_USER=y
>CONFIG_GENERIC_STRNLEN_USER=y
>CONFIG_GENERIC_NET_UTILS=y
>CONFIG_CORDIC=y
>CONFIG_PRIME_NUMBERS=y
>CONFIG_RATIONAL=y
>CONFIG_GENERIC_PCI_IOMAP=y
>CONFIG_GENERIC_IOMAP=y
>CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
>CONFIG_ARCH_USE_SYM_ANNOTATIONS=y
>
>#
># Crypto library routines
>#
>CONFIG_CRYPTO_LIB_UTILS=y
>CONFIG_CRYPTO_LIB_AES=y
>CONFIG_CRYPTO_LIB_ARC4=y
>CONFIG_CRYPTO_LIB_GF128MUL=y
>CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
>CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
>CONFIG_CRYPTO_LIB_CHACHA=y
>CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
># CONFIG_CRYPTO_LIB_CURVE25519 is not set
>CONFIG_CRYPTO_LIB_DES=y
>CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
>CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
># CONFIG_CRYPTO_LIB_POLY1305 is not set
># CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
>CONFIG_CRYPTO_LIB_SHA1=y
>CONFIG_CRYPTO_LIB_SHA256=y
># end of Crypto library routines
>
>CONFIG_CRC_CCITT=y
>CONFIG_CRC16=y
># CONFIG_CRC_T10DIF is not set
># CONFIG_CRC64_ROCKSOFT is not set
>CONFIG_CRC_ITU_T=y
>CONFIG_CRC32=y
># CONFIG_CRC32_SELFTEST is not set
># CONFIG_CRC32_SLICEBY8 is not set
># CONFIG_CRC32_SLICEBY4 is not set
>CONFIG_CRC32_SARWATE=y
># CONFIG_CRC32_BIT is not set
>CONFIG_CRC64=y
>CONFIG_CRC4=y
># CONFIG_CRC7 is not set
>CONFIG_LIBCRC32C=y
>CONFIG_CRC8=y
>CONFIG_XXHASH=y
># CONFIG_RANDOM32_SELFTEST is not set
>CONFIG_842_COMPRESS=y
>CONFIG_842_DECOMPRESS=y
>CONFIG_ZLIB_INFLATE=y
>CONFIG_ZLIB_DEFLATE=y
>CONFIG_LZO_COMPRESS=y
>CONFIG_LZO_DECOMPRESS=y
>CONFIG_LZ4_COMPRESS=y
>CONFIG_LZ4HC_COMPRESS=y
>CONFIG_LZ4_DECOMPRESS=y
>CONFIG_ZSTD_COMMON=y
>CONFIG_ZSTD_COMPRESS=y
>CONFIG_ZSTD_DECOMPRESS=y
>CONFIG_XZ_DEC=y
># CONFIG_XZ_DEC_X86 is not set
># CONFIG_XZ_DEC_POWERPC is not set
># CONFIG_XZ_DEC_IA64 is not set
>CONFIG_XZ_DEC_ARM=y
># CONFIG_XZ_DEC_ARMTHUMB is not set
># CONFIG_XZ_DEC_SPARC is not set
>CONFIG_XZ_DEC_MICROLZMA=y
>CONFIG_XZ_DEC_BCJ=y
># CONFIG_XZ_DEC_TEST is not set
>CONFIG_DECOMPRESS_GZIP=y
>CONFIG_DECOMPRESS_LZ4=y
>CONFIG_DECOMPRESS_ZSTD=y
>CONFIG_GENERIC_ALLOCATOR=y
>CONFIG_REED_SOLOMON=y
>CONFIG_REED_SOLOMON_ENC8=y
>CONFIG_REED_SOLOMON_DEC8=y
>CONFIG_REED_SOLOMON_DEC16=y
>CONFIG_BCH=y
>CONFIG_TEXTSEARCH=y
>CONFIG_TEXTSEARCH_KMP=y
>CONFIG_TEXTSEARCH_BM=y
>CONFIG_TEXTSEARCH_FSM=y
>CONFIG_INTERVAL_TREE=y
>CONFIG_ASSOCIATIVE_ARRAY=y
>CONFIG_HAS_IOMEM=y
>CONFIG_HAS_IOPORT=y
>CONFIG_HAS_IOPORT_MAP=y
>CONFIG_HAS_DMA=y
>CONFIG_DMA_OPS=y
>CONFIG_NEED_SG_DMA_LENGTH=y
>CONFIG_DMA_DECLARE_COHERENT=y
># CONFIG_DMA_API_DEBUG is not set
>CONFIG_DMA_MAP_BENCHMARK=y
>CONFIG_SGL_ALLOC=y
>CONFIG_DQL=y
>CONFIG_GLOB=y
># CONFIG_GLOB_SELFTEST is not set
>CONFIG_NLATTR=y
>CONFIG_CLZ_TAB=y
>CONFIG_IRQ_POLL=y
>CONFIG_MPILIB=y
>CONFIG_DIMLIB=y
>CONFIG_LIBFDT=y
>CONFIG_UCS2_STRING=y
>CONFIG_HAVE_GENERIC_VDSO=y
>CONFIG_GENERIC_GETTIMEOFDAY=y
>CONFIG_GENERIC_VDSO_32=y
>CONFIG_GENERIC_VDSO_TIME_NS=y
>CONFIG_FONT_SUPPORT=y
>CONFIG_FONT_8x16=y
>CONFIG_FONT_AUTOSELECT=y
>CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
>CONFIG_ARCH_STACKWALK=y
>CONFIG_STACKDEPOT=y
>CONFIG_STACKDEPOT_ALWAYS_INIT=y
>CONFIG_REF_TRACKER=y
># end of Library routines
>
>CONFIG_POLYNOMIAL=y
>
>#
># Kernel hacking
>#
>
>#
># printk and dmesg options
>#
>CONFIG_PRINTK_TIME=y
>CONFIG_PRINTK_CALLER=y
>CONFIG_STACKTRACE_BUILD_ID=y
>CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
>CONFIG_CONSOLE_LOGLEVEL_QUIET=4
>CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
># CONFIG_BOOT_PRINTK_DELAY is not set
># CONFIG_DYNAMIC_DEBUG is not set
># CONFIG_DYNAMIC_DEBUG_CORE is not set
>CONFIG_SYMBOLIC_ERRNAME=y
>CONFIG_DEBUG_BUGVERBOSE=y
># end of printk and dmesg options
>
>CONFIG_DEBUG_KERNEL=y
># CONFIG_DEBUG_MISC is not set
>
>#
># Compile-time checks and compiler options
>#
>CONFIG_DEBUG_INFO=y
>CONFIG_AS_HAS_NON_CONST_LEB128=y
># CONFIG_DEBUG_INFO_NONE is not set
>CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
># CONFIG_DEBUG_INFO_DWARF4 is not set
># CONFIG_DEBUG_INFO_DWARF5 is not set
>CONFIG_DEBUG_INFO_REDUCED=y
>CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
># CONFIG_DEBUG_INFO_SPLIT is not set
>CONFIG_PAHOLE_HAS_SPLIT_BTF=y
>CONFIG_PAHOLE_HAS_BTF_TAG=y
>CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
>CONFIG_GDB_SCRIPTS=y
>CONFIG_FRAME_WARN=8192
>CONFIG_STRIP_ASM_SYMS=y
># CONFIG_HEADERS_INSTALL is not set
>CONFIG_SECTION_MISMATCH_WARN_ONLY=y
>CONFIG_FRAME_POINTER=y
># CONFIG_VMLINUX_MAP is not set
>CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
># end of Compile-time checks and compiler options
>
>#
># Generic Kernel Debugging Instruments
>#
>CONFIG_MAGIC_SYSRQ=y
>CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
>CONFIG_MAGIC_SYSRQ_SERIAL=y
>CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
>CONFIG_DEBUG_FS=y
># CONFIG_DEBUG_FS_ALLOW_ALL is not set
># CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
>CONFIG_DEBUG_FS_ALLOW_NONE=y
>CONFIG_HAVE_ARCH_KGDB=y
># CONFIG_KGDB is not set
>CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
>CONFIG_UBSAN=y
># CONFIG_UBSAN_TRAP is not set
>CONFIG_CC_HAS_UBSAN_BOUNDS=y
>CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
>CONFIG_UBSAN_BOUNDS=y
>CONFIG_UBSAN_ARRAY_BOUNDS=y
>CONFIG_UBSAN_SHIFT=y
>CONFIG_UBSAN_UNREACHABLE=y
># CONFIG_UBSAN_BOOL is not set
># CONFIG_UBSAN_ENUM is not set
># CONFIG_UBSAN_ALIGNMENT is not set
>CONFIG_UBSAN_SANITIZE_ALL=y
># CONFIG_TEST_UBSAN is not set
>CONFIG_HAVE_KCSAN_COMPILER=y
># end of Generic Kernel Debugging Instruments
>
>#
># Networking Debugging
>#
># CONFIG_NET_DEV_REFCNT_TRACKER is not set
>CONFIG_NET_NS_REFCNT_TRACKER=y
># CONFIG_DEBUG_NET is not set
># end of Networking Debugging
>
>#
># Memory Debugging
>#
>CONFIG_PAGE_EXTENSION=y
># CONFIG_DEBUG_PAGEALLOC is not set
># CONFIG_SLUB_DEBUG is not set
>CONFIG_PAGE_OWNER=y
># CONFIG_PAGE_POISONING is not set
>CONFIG_DEBUG_PAGE_REF=y
># CONFIG_DEBUG_RODATA_TEST is not set
>CONFIG_ARCH_HAS_DEBUG_WX=y
>CONFIG_DEBUG_WX=y
>CONFIG_GENERIC_PTDUMP=y
>CONFIG_PTDUMP_CORE=y
>CONFIG_PTDUMP_DEBUGFS=y
>CONFIG_HAVE_DEBUG_KMEMLEAK=y
>CONFIG_DEBUG_KMEMLEAK=y
>CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
># CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
>CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=y
>CONFIG_DEBUG_OBJECTS=y
># CONFIG_DEBUG_OBJECTS_SELFTEST is not set
>CONFIG_DEBUG_OBJECTS_FREE=y
># CONFIG_DEBUG_OBJECTS_TIMERS is not set
># CONFIG_DEBUG_OBJECTS_WORK is not set
># CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
>CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
>CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
>CONFIG_SHRINKER_DEBUG=y
># CONFIG_DEBUG_STACK_USAGE is not set
>CONFIG_SCHED_STACK_END_CHECK=y
>CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
>CONFIG_DEBUG_VM_IRQSOFF=y
>CONFIG_DEBUG_VM=y
>CONFIG_DEBUG_VM_MAPLE_TREE=y
># CONFIG_DEBUG_VM_RB is not set
>CONFIG_DEBUG_VM_PGFLAGS=y
>CONFIG_DEBUG_VM_PGTABLE=y
>CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
>CONFIG_DEBUG_VIRTUAL=y
>CONFIG_DEBUG_MEMORY_INIT=y
>CONFIG_DEBUG_KMAP_LOCAL=y
>CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
>CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP=y
># CONFIG_DEBUG_HIGHMEM is not set
>CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
>CONFIG_DEBUG_STACKOVERFLOW=y
>CONFIG_CC_HAS_KASAN_GENERIC=y
>CONFIG_CC_HAS_KASAN_SW_TAGS=y
>CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
>CONFIG_HAVE_ARCH_KFENCE=y
># CONFIG_KFENCE is not set
>CONFIG_HAVE_KMSAN_COMPILER=y
># end of Memory Debugging
>
>CONFIG_DEBUG_SHIRQ=y
>
>#
># Debug Oops, Lockups and Hangs
>#
>CONFIG_PANIC_ON_OOPS=y
>CONFIG_PANIC_ON_OOPS_VALUE=1
>CONFIG_PANIC_TIMEOUT=0
>CONFIG_LOCKUP_DETECTOR=y
>CONFIG_SOFTLOCKUP_DETECTOR=y
>CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
>CONFIG_HARDLOCKUP_DETECTOR_PERF=y
>CONFIG_HARDLOCKUP_DETECTOR=y
># CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
>CONFIG_DETECT_HUNG_TASK=y
>CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
># CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
>CONFIG_WQ_WATCHDOG=y
># CONFIG_TEST_LOCKUP is not set
># end of Debug Oops, Lockups and Hangs
>
>#
># Scheduler Debugging
>#
>CONFIG_SCHED_DEBUG=y
>CONFIG_SCHED_INFO=y
>CONFIG_SCHEDSTATS=y
># end of Scheduler Debugging
>
>CONFIG_DEBUG_TIMEKEEPING=y
>
>#
># Lock Debugging (spinlocks, mutexes, etc...)
>#
>CONFIG_LOCK_DEBUGGING_SUPPORT=y
>CONFIG_PROVE_LOCKING=y
># CONFIG_PROVE_RAW_LOCK_NESTING is not set
>CONFIG_LOCK_STAT=y
>CONFIG_DEBUG_RT_MUTEXES=y
>CONFIG_DEBUG_SPINLOCK=y
>CONFIG_DEBUG_MUTEXES=y
>CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
>CONFIG_DEBUG_RWSEMS=y
>CONFIG_DEBUG_LOCK_ALLOC=y
>CONFIG_LOCKDEP=y
>CONFIG_LOCKDEP_BITS=15
>CONFIG_LOCKDEP_CHAINS_BITS=16
>CONFIG_LOCKDEP_STACK_TRACE_BITS=19
>CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
>CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
># CONFIG_DEBUG_LOCKDEP is not set
>CONFIG_DEBUG_ATOMIC_SLEEP=y
># CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
>CONFIG_LOCK_TORTURE_TEST=m
># CONFIG_WW_MUTEX_SELFTEST is not set
># CONFIG_SCF_TORTURE_TEST is not set
># end of Lock Debugging (spinlocks, mutexes, etc...)
>
>CONFIG_TRACE_IRQFLAGS=y
>CONFIG_TRACE_IRQFLAGS_NMI=y
># CONFIG_NMI_CHECK_CPU is not set
>CONFIG_DEBUG_IRQFLAGS=y
>CONFIG_STACKTRACE=y
># CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
># CONFIG_DEBUG_KOBJECT is not set
>
>#
># Debug kernel data structures
>#
>CONFIG_DEBUG_LIST=y
># CONFIG_DEBUG_PLIST is not set
>CONFIG_DEBUG_SG=y
># CONFIG_DEBUG_NOTIFIERS is not set
># CONFIG_BUG_ON_DATA_CORRUPTION is not set
>CONFIG_DEBUG_MAPLE_TREE=y
># end of Debug kernel data structures
>
>CONFIG_DEBUG_CREDENTIALS=y
>
>#
># RCU Debugging
>#
>CONFIG_PROVE_RCU=y
>CONFIG_PROVE_RCU_LIST=y
>CONFIG_TORTURE_TEST=m
>CONFIG_RCU_SCALE_TEST=m
>CONFIG_RCU_TORTURE_TEST=m
>CONFIG_RCU_REF_SCALE_TEST=m
>CONFIG_RCU_TRACE=y
>CONFIG_RCU_EQS_DEBUG=y
># end of RCU Debugging
>
># CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
>CONFIG_LATENCYTOP=y
># CONFIG_DEBUG_CGROUP_REF is not set
>CONFIG_USER_STACKTRACE_SUPPORT=y
>CONFIG_NOP_TRACER=y
>CONFIG_HAVE_RETHOOK=y
>CONFIG_RETHOOK=y
>CONFIG_HAVE_FUNCTION_TRACER=y
>CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
>CONFIG_HAVE_DYNAMIC_FTRACE=y
>CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
>CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
>CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
>CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
>CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
>CONFIG_HAVE_FENTRY=y
>CONFIG_HAVE_C_RECORDMCOUNT=y
>CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
>CONFIG_BUILDTIME_MCOUNT_SORT=y
>CONFIG_TRACER_MAX_TRACE=y
>CONFIG_TRACE_CLOCK=y
>CONFIG_RING_BUFFER=y
>CONFIG_EVENT_TRACING=y
>CONFIG_CONTEXT_SWITCH_TRACER=y
>CONFIG_PREEMPTIRQ_TRACEPOINTS=y
>CONFIG_TRACING=y
>CONFIG_GENERIC_TRACER=y
>CONFIG_TRACING_SUPPORT=y
>CONFIG_FTRACE=y
># CONFIG_BOOTTIME_TRACING is not set
>CONFIG_FUNCTION_TRACER=y
># CONFIG_FUNCTION_GRAPH_TRACER is not set
>CONFIG_DYNAMIC_FTRACE=y
>CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
>CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
>CONFIG_FPROBE=y
># CONFIG_FUNCTION_PROFILER is not set
>CONFIG_STACK_TRACER=y
># CONFIG_IRQSOFF_TRACER is not set
># CONFIG_SCHED_TRACER is not set
># CONFIG_HWLAT_TRACER is not set
>CONFIG_OSNOISE_TRACER=y
># CONFIG_TIMERLAT_TRACER is not set
># CONFIG_MMIOTRACE is not set
># CONFIG_FTRACE_SYSCALLS is not set
># CONFIG_TRACER_SNAPSHOT is not set
>CONFIG_TRACE_BRANCH_PROFILING=y
># CONFIG_BRANCH_PROFILE_NONE is not set
>CONFIG_PROFILE_ANNOTATED_BRANCHES=y
># CONFIG_PROFILE_ALL_BRANCHES is not set
># CONFIG_BRANCH_TRACER is not set
>CONFIG_KPROBE_EVENTS=y
># CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
>CONFIG_UPROBE_EVENTS=y
>CONFIG_BPF_EVENTS=y
>CONFIG_DYNAMIC_EVENTS=y
>CONFIG_PROBE_EVENTS=y
>CONFIG_BPF_KPROBE_OVERRIDE=y
>CONFIG_FTRACE_MCOUNT_RECORD=y
>CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT=y
>CONFIG_TRACING_MAP=y
>CONFIG_SYNTH_EVENTS=y
>CONFIG_USER_EVENTS=y
>CONFIG_HIST_TRIGGERS=y
>CONFIG_TRACE_EVENT_INJECT=y
># CONFIG_TRACEPOINT_BENCHMARK is not set
>CONFIG_RING_BUFFER_BENCHMARK=y
>CONFIG_TRACE_EVAL_MAP_FILE=y
># CONFIG_FTRACE_RECORD_RECURSION is not set
># CONFIG_FTRACE_STARTUP_TEST is not set
># CONFIG_FTRACE_SORT_STARTUP_TEST is not set
># CONFIG_RING_BUFFER_STARTUP_TEST is not set
># CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
># CONFIG_PREEMPTIRQ_DELAY_TEST is not set
># CONFIG_SYNTH_EVENT_GEN_TEST is not set
># CONFIG_KPROBE_EVENT_GEN_TEST is not set
># CONFIG_HIST_TRIGGERS_DEBUG is not set
>CONFIG_DA_MON_EVENTS=y
>CONFIG_DA_MON_EVENTS_ID=y
>CONFIG_RV=y
>CONFIG_RV_MON_WWNR=y
>CONFIG_RV_REACTORS=y
>CONFIG_RV_REACT_PRINTK=y
># CONFIG_RV_REACT_PANIC is not set
># CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
># CONFIG_SAMPLES is not set
>CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
># CONFIG_STRICT_DEVMEM is not set
>
>#
># x86 Debugging
>#
>CONFIG_EARLY_PRINTK_USB=y
>CONFIG_X86_VERBOSE_BOOTUP=y
>CONFIG_EARLY_PRINTK=y
>CONFIG_EARLY_PRINTK_DBGP=y
>CONFIG_EARLY_PRINTK_USB_XDBC=y
>CONFIG_EFI_PGT_DUMP=y
>CONFIG_DEBUG_TLBFLUSH=y
>CONFIG_HAVE_MMIOTRACE_SUPPORT=y
># CONFIG_X86_DECODER_SELFTEST is not set
># CONFIG_IO_DELAY_0X80 is not set
># CONFIG_IO_DELAY_0XED is not set
>CONFIG_IO_DELAY_UDELAY=y
># CONFIG_IO_DELAY_NONE is not set
>CONFIG_DEBUG_BOOT_PARAMS=y
># CONFIG_CPA_DEBUG is not set
>CONFIG_DEBUG_ENTRY=y
>CONFIG_X86_DEBUG_FPU=y
># CONFIG_PUNIT_ATOM_DEBUG is not set
>CONFIG_UNWINDER_FRAME_POINTER=y
># end of x86 Debugging
>
>#
># Kernel Testing and Coverage
>#
># CONFIG_KUNIT is not set
>CONFIG_NOTIFIER_ERROR_INJECTION=y
>CONFIG_PM_NOTIFIER_ERROR_INJECT=y
>CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=y
>CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=y
>CONFIG_FUNCTION_ERROR_INJECTION=y
>CONFIG_FAULT_INJECTION=y
>CONFIG_FAILSLAB=y
>CONFIG_FAIL_PAGE_ALLOC=y
>CONFIG_FAULT_INJECTION_USERCOPY=y
># CONFIG_FAIL_FUTEX is not set
># CONFIG_FAULT_INJECTION_DEBUG_FS is not set
># CONFIG_FAULT_INJECTION_CONFIGFS is not set
>CONFIG_CC_HAS_SANCOV_TRACE_PC=y
># CONFIG_RUNTIME_TESTING_MENU is not set
>CONFIG_ARCH_USE_MEMTEST=y
># CONFIG_MEMTEST is not set
># end of Kernel Testing and Coverage
>
>#
># Rust hacking
>#
># end of Rust hacking
># end of Kernel hacking

