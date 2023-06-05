Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A550525E;
	Mon,  5 Jun 2023 12:18:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULqD+5H88mfmbzVWsnl6jP7EAqFgDzhKZYZpbJnq30DSh0B7PBiONqRUmbWMw2Dc/svhp87lVP3QDUJSetQn8Y0sBmzHGPHOqQasqvy1sylfiXh6M/5mGA/8ZHPAEmNmZePHYeDa6t1rwnl8PqmoboUVKx2RzIxw9577GmGhhyu+ATRgsAHigxgWAKbPiZ05B7vfMMo4FzBfbsw0qovOvoMxIbxOFpOIU9cYb7Yksdjx5upDvDjT43NM4LnPbHntEuTPN432ZDAxxMOTBIFdCUNMNXc7KOW6aCztviIsbhU0YDDKYB5F0PeIo722Vd6EMDN5jxexCDTfzVKcMWqfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i44w0V/2Z4feNn9RKUAavBWCxB5AlB/2FwoxXKqAUUo=;
 b=GT0y/CsUoB2nu64sCm0UJLZY8EJ6dZIDeNuogjDFhjPdG/exnsrSTYlzk3iVqLn64asMqvOd3/DDRTv+3skqDny5S6vxtkZORb2UdqANoIidQxA0eU27lHjzl0zRg/p1+FqgXlipnJxbN/QwQWqJDHO8LTksJWeeFYCp1922p7VKjSk0/HX9LHbw+fwQwoWCPicXdC7jlbvTiInhQs1KKYo1LkoyO65vPgb8pNmmJmuBybjgRALSGA0aPasUz1mL7Io9qphVGVb9yAW/PihHXkaBdt5u/gCEg5tKMdUvUXbqiUCnoaSbvGMhbETuCM01CzmrjBy2FtVycAXzhM07AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i44w0V/2Z4feNn9RKUAavBWCxB5AlB/2FwoxXKqAUUo=;
 b=HyA8wW0jUgF89pV3aGl3GN2LEzilSV7bYPdWVUVLhn9R9myQCammIMmD5yWh4sbe2Xw7CLiS+84iMz5noEofc4ibVbbihrBlJFqAiIHtlxec62b2S43CTzuu7PYPTYMGUw9BLo4Lq9okyNvi35Ee6ueG+XvE1wdMSVE+cr3Qnt4D4nh/JvQdzHb43l14CzSIE57M2QV6L3jrSDHN2Q6wthwK2W9PNxyPoRHfNKd6ipK5eR0yEru5ASDJoh6JLl/iCU4LrlTR8Jh7iK1+oHM/xXOCh5OTnGmmDXNRF7FTfsRZ6IvHdHOBTULSejgljw31I+8cHQufFWUj0VR+l/0jSw==
Received: from BN9PR03CA0312.namprd03.prod.outlook.com (2603:10b6:408:112::17)
 by IA0PR12MB8645.namprd12.prod.outlook.com (2603:10b6:208:48f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 12:18:20 +0000
Received: from BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::fb) by BN9PR03CA0312.outlook.office365.com
 (2603:10b6:408:112::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Mon, 5 Jun 2023 12:18:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT093.mail.protection.outlook.com (10.13.177.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33 via Frontend Transport; Mon, 5 Jun 2023 12:18:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 5 Jun 2023
 05:18:07 -0700
Received: from fedora.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 5 Jun 2023
 05:18:06 -0700
References: <202306051816.mO3hqt7d-lkp@intel.com>
User-agent: mu4e 1.8.11; emacs 28.2
From: Vlad Buslov <vladbu@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Pirko
	<jiri@nvidia.com>, Sasha Levin <sashal@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [stable:linux-5.4.y 3300/8640] net/sched/cls_flower.c:296:12:
 warning: stack frame size (1040) exceeds limit (1024) in 'fl_classify'
Date: Mon, 5 Jun 2023 15:11:24 +0300
In-Reply-To: <202306051816.mO3hqt7d-lkp@intel.com>
Message-ID: <873536xfus.fsf@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT093:EE_|IA0PR12MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: dde00925-d1df-4bbe-bc61-08db65bef33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	efxUb6NqJl83NJxJ0JGaZim568lwbCk6Ya3qLl3Wo2FCsInBGX5ZOVL0xI0JcePumN4mOwYjVei335/hKn5C4/RpJr2K1XlsZpHrFKp7MW5TxIKSA2o0w5FRf829ntNZB8ZigNNU9TgNOL6FGABglw0Sv1LTVXO1CWm6gySlir0ttJKRthgaukcjcXqdCN5zw8NR5rByVnwGXF1SIIkOpNJU3oVDiHFYv0IVewqYALUJBs9YDvp7Fq5ttYXSXWSrxAlmdFFtqgIoZD9uE+OHBpS5Yh6FTFxMhzZoAIhGGsH6iyBJgW/HdfWbqVCSJ22RrSjtnNVSkRA4c5gIe9aKALky95uYi4ZcsEkJz0qrZOLujOWXbAmf5YomrNXqGp/yG8o1KHiZ6StbSmnY4rXahUN+B3Q9aW1aeQe1g3YtlaU5WYfPrvVgCPWGEtayjPAg/yX+tb+njRlv3/3qDJr2AKihLP4eZbrscivEzN/u3p18dcx7eO/CNG4BIx+fEe47X4vC0pJh1rE7HicU641UmMXsocTz1oaHxIxFPIJopT+S83voZed6m+VRQtuVj0urODi+QZrenRNSgE/jo+jkwZAc/WDf5peybixgUI1mv0c4ORUVCsqFvFYP7J0bEE0AXYRvwciIH0YqcgyfaEDdbkzG4mJWHFm/jHSHehT2TfEtl3YVTv1QAnVRhS8QodHeCe+xJbxIsmlmEKq6PESLAH89WCUuY39QshxK7Rl/Jo8neB+0F7D7W+hFyZPlqpwaDSqdVtGeQ4JQYPoOexpaAA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199021)(36840700001)(40470700004)(46966006)(36860700001)(66574015)(47076005)(83380400001)(40480700001)(86362001)(82310400005)(40460700003)(82740400003)(7636003)(356005)(478600001)(54906003)(110136005)(6666004)(7696005)(966005)(5660300002)(8676002)(8936002)(70206006)(70586007)(4326008)(2906002)(4001150100001)(316002)(41300700001)(2616005)(426003)(336012)(26005)(36756003)(16526019)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 12:18:19.9996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dde00925-d1df-4bbe-bc61-08db65bef33b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8645

On Mon 05 Jun 2023 at 18:59, kernel test robot <lkp@intel.com> wrote:
> Hi Vlad,
>
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le.git linux-5.4.y
> head:   cf0b1e5482eaeb4db15c9e703267483dba88b575
> commit: 5f2e54391893c67b709a64b280417ca0318adb73 [3300/8640] net/sched: f=
lower: fix parsing of ethertype following VLAN header
> config: mips-randconfig-r013-20230605 (https://download.01.org/0day-ci/ar=
chive/20230605/202306051816.mO3hqt7d-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf=
3aaf28226a4e950c103a14f6fc1d1fdabb1b)
> reproduce (this is a W=3D1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mipsel-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able.git/commit/?id=3D5f2e54391893c67b709a64b280417ca0318adb73
>         git remote add stable https://git.kernel.org/pub/scm/linux/kernel=
/git/stable/linux-stable.git
>         git fetch --no-tags stable linux-5.4.y
>         git checkout 5f2e54391893c67b709a64b280417ca0318adb73
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Dmips olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash net/sched/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306051816.mO3hqt7d-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> net/sched/cls_flower.c:296:12: warning: stack frame size (1040) exceeds=
 limit (1024) in 'fl_classify' [-Wframe-larger-than]
>    static int fl_classify(struct sk_buff *skb, const struct tcf_proto *tp,
>               ^
>    1 warning generated.
>
>
> vim +/fl_classify +296 net/sched/cls_flower.c
>
> e0ace68af2acfe Paul Blakey            2019-07-09  295=20=20
> 77b9900ef53ae0 Jiri Pirko             2015-05-12 @296  static int fl_clas=
sify(struct sk_buff *skb, const struct tcf_proto *tp,
> 77b9900ef53ae0 Jiri Pirko             2015-05-12  297  		       struct tc=
f_result *res)
> 77b9900ef53ae0 Jiri Pirko             2015-05-12  298  {
> 77b9900ef53ae0 Jiri Pirko             2015-05-12  299  	struct cls_fl_hea=
d *head =3D rcu_dereference_bh(tp->root);
> 77b9900ef53ae0 Jiri Pirko             2015-05-12  300  	struct fl_flow_ke=
y skb_mkey;

The stack usage of fl_classify() has already been addressed in later
kernels by commit 0af413bd3e2d ("flow_dissector: work around stack frame
size warning") which moved mkey into fl_mask_lookup(). Not sure what
else can be done since my commit just adds a new flow dissector fields
that are needed to correctly parse packets with multiple VLAN headers.

> e0ace68af2acfe Paul Blakey            2019-07-09  301  	struct fl_flow_ke=
y skb_key;
> e0ace68af2acfe Paul Blakey            2019-07-09  302  	struct fl_flow_ma=
sk *mask;
> e0ace68af2acfe Paul Blakey            2019-07-09  303  	struct cls_fl_fil=
ter *f;
> 77b9900ef53ae0 Jiri Pirko             2015-05-12  304=20=20
> 05cd271fd61a0b Paul Blakey            2018-04-30  305  	list_for_each_ent=
ry_rcu(mask, &head->masks, list) {
> 50acd32ea7f682 Jason Baron            2020-02-17  306  		flow_dissector_i=
nit_keys(&skb_key.control, &skb_key.basic);
> 05cd271fd61a0b Paul Blakey            2018-04-30  307  		fl_clear_masked_=
range(&skb_key, mask);
> bc3103f1ed405d Amir Vadai             2016-09-08  308=20=20
> 8212ed777f40c7 Jiri Pirko             2019-06-19  309  		skb_flow_dissect=
_meta(skb, &mask->dissector, &skb_key);
> 05cd271fd61a0b Paul Blakey            2018-04-30  310  		/* skb_flow_diss=
ect() does not set n_proto in case an unknown
> 05cd271fd61a0b Paul Blakey            2018-04-30  311  		 * protocol, so =
do it rather here.
> 77b9900ef53ae0 Jiri Pirko             2015-05-12  312  		 */
> 9b7fd81cf9b6ca Toke H=C3=B8iland-J=C3=B8rgensen 2020-07-03  313  		skb_ke=
y.basic.n_proto =3D skb_protocol(skb, false);
> 05cd271fd61a0b Paul Blakey            2018-04-30  314  		skb_flow_dissect=
_tunnel_info(skb, &mask->dissector, &skb_key);
> e0ace68af2acfe Paul Blakey            2019-07-09  315  		skb_flow_dissect=
_ct(skb, &mask->dissector, &skb_key,
> e0ace68af2acfe Paul Blakey            2019-07-09  316  				    fl_ct_info=
_to_flower_map,
> e0ace68af2acfe Paul Blakey            2019-07-09  317  				    ARRAY_SIZE=
(fl_ct_info_to_flower_map));
> 05cd271fd61a0b Paul Blakey            2018-04-30  318  		skb_flow_dissect=
(skb, &mask->dissector, &skb_key, 0);
> 77b9900ef53ae0 Jiri Pirko             2015-05-12  319=20=20
> 05cd271fd61a0b Paul Blakey            2018-04-30  320  		fl_set_masked_ke=
y(&skb_mkey, &skb_key, mask);
> 77b9900ef53ae0 Jiri Pirko             2015-05-12  321=20=20
> 5c72299fba9df4 Amritha Nambiar        2018-11-12  322  		f =3D fl_lookup(=
mask, &skb_mkey, &skb_key);
> e8eb36cd8ca93f Amir Vadai             2016-06-13  323  		if (f && !tc_ski=
p_sw(f->flags)) {
> 77b9900ef53ae0 Jiri Pirko             2015-05-12  324  			*res =3D f->res;
> 77b9900ef53ae0 Jiri Pirko             2015-05-12  325  			return tcf_exts=
_exec(skb, &f->exts, res);
> 77b9900ef53ae0 Jiri Pirko             2015-05-12  326  		}
> 05cd271fd61a0b Paul Blakey            2018-04-30  327  	}
> 77b9900ef53ae0 Jiri Pirko             2015-05-12  328  	return -1;
> 77b9900ef53ae0 Jiri Pirko             2015-05-12  329  }
> 77b9900ef53ae0 Jiri Pirko             2015-05-12  330=20=20
>
> :::::: The code at line 296 was first introduced by commit
> :::::: 77b9900ef53ae047e36a37d13a2aa33bb2d60641 tc: introduce Flower clas=
sifier
>
> :::::: TO: Jiri Pirko <jiri@resnulli.us>
> :::::: CC: David S. Miller <davem@davemloft.net>

