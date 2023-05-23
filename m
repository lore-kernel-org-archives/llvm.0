Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDDD21CE3
	for <llvm@lists.linux.dev>; Tue, 23 May 2023 18:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1684866687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xKG9Mz6H/saRiZk8cDraz5VKbIBuZpBcCLeJz9BiIeo=;
	b=gqhus1ragHgyLCax014/Oes3/SRfohvP7E85HWIvoJn1Q5WIE2xAAEkM4Sfsh5GXvgacRQ
	eF/eij4mPvFDWsf3LF09AOK5YxndxNlismYL/Ep8wELa4uGB+IBYJp8CRJntTj7rf+JjJ+
	ysWJb3Nrv8Y0ogsSprJeThGQl/mKgjQ=
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-_51KRq3kM3Go6jgB25qK9Q-1; Tue, 23 May 2023 14:31:25 -0400
X-MC-Unique: _51KRq3kM3Go6jgB25qK9Q-1
Received: from MW4PR84MB1970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1b1::7)
 by SJ0PR84MB1409.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:419::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 18:31:22 +0000
Received: from MW4PR84MB1970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5754:672e:42fa:f417]) by MW4PR84MB1970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5754:672e:42fa:f417%7]) with mapi id 15.20.6433.013; Tue, 23 May 2023
 18:31:21 +0000
From: "Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>
To: "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Sasha Levin
	<sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: [linux-stable-rc:queue/5.15 105/106]
 drivers/platform/x86/hp/hp-wmi.c:342:24: warning: cast to smaller integer
 type 'enum hp_wmi_radio' from 'void *'
Thread-Topic: [linux-stable-rc:queue/5.15 105/106]
 drivers/platform/x86/hp/hp-wmi.c:342:24: warning: cast to smaller integer
 type 'enum hp_wmi_radio' from 'void *'
Thread-Index: AQHZi2Np5ZtE2FLTYk6rm5bhgUan7K9oMiAQ
Date: Tue, 23 May 2023 18:31:21 +0000
Message-ID: <MW4PR84MB19703614A2DB230AD0BAF63CA8409@MW4PR84MB1970.NAMPRD84.PROD.OUTLOOK.COM>
References: <202305210504.yw7qgOom-lkp@intel.com>
In-Reply-To: <202305210504.yw7qgOom-lkp@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: b9547415-8e03-4276-b118-e47e8b037223
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR84MB1970:EE_|SJ0PR84MB1409:EE_
x-ms-office365-filtering-correlation-id: a6c39da5-b1ef-4b3c-05a1-08db5bbbe85b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: A7rzIDQd0avVRn8pbBtgHkg4X8/G6qaTTQphkQN53tAcKc3u/JxtToFg3ALtMoJuRjq7jtKVgP7eAtpENN3a1KdGQyDebpAp1Lm9T+ZqbMwNftRzwnLJResFO/PgEtn+Zs70mxiEl4gB/TbC7r7s/hOuQvFW9g++dWtjw5QeCtTUB9Yxj4ikmGg+eP2KLtpGVz/Sdgl2UrtYPrcjZEPKZNf5bk2S8Udx9ZO9zEd/qVzQjc6d3DiO3E0KoBl0+qQWGYnPBYAkYovHvPng/QgW91+1eyzWny//lm43ZGCzoxwsPAJkuYNmGbJq/FYaGjiOv2soPKQLsE1FzC78L6teXCCg/lFtwGMciY+pe0mFfVKu0GZR5c9W+88HxNjGAq7F+fNEfZQWT4TDVRnz/EqnLVuHcClkLldbvr0G5iF/3qOd0Wsp7zeWV8my6Woejw7JS3ee2yfuHJ2bdbwYqmjYtpMKq+Yj6Fvpu0RPPlvLtI3SqmJ8zSLWUpBIZUCq+Bo89trbXvWBSqLiBvp8wzgmPHii+KnR/H/OHGDGqZRWbMfO16VTQwuOkWuHpXAtji8C5gFOOn0r9QAxfBOHKVGwI0sTfzcVC53dsMM/BqEStkU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR84MB1970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199021)(55016003)(38100700002)(33656002)(26005)(186003)(53546011)(122000001)(6506007)(9686003)(82960400001)(83380400001)(2906002)(41300700001)(7696005)(316002)(71200400001)(110136005)(966005)(478600001)(66446008)(66946007)(66556008)(66476007)(76116006)(64756008)(38070700005)(86362001)(8936002)(8676002)(5660300002)(52536014);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tVmIQs5oZc9+m4sBEbkIoMlRGfsv5Gc6OXcJorC13gDFSOEgnbiDBsZK1AI+?=
 =?us-ascii?Q?p2/Ehfn8Q/N+n7XHO+vEMOjVUkv47bCHyDtAG/KBcsz7ymSmABbSByClbPl/?=
 =?us-ascii?Q?YS63oPRh3VBT5+/REpG1IORNe1eXzQqd9X40sfH706r+iPteOnv3JE7GyOg9?=
 =?us-ascii?Q?em0jK+MlN9vzsfdMcRZDHUUfLh2WsIm4byuRMVbbL6iIUeE5/Ax+pPHA6lZD?=
 =?us-ascii?Q?iE94WXhlnN3S+vKoQ9X10HyrUTVUNih6qD6An6cRREO/9ZNpaC9PRwOP/M6q?=
 =?us-ascii?Q?3Hd9G+UcQ60WlND3OKQq2T1BYJhpISb9jTKfymoTEpmiySSKfYrtu2kMngVX?=
 =?us-ascii?Q?910bXufMtfBencvEPwnmPT+ZyWUdCXlcrzcJNBV3qVCEEgrCNjj25+arwOt1?=
 =?us-ascii?Q?UHeXdIuZocL/WvRluyam8hVcUC/CIOb5MtpLXtOhnYkSkzPy+4+SujyfvSMj?=
 =?us-ascii?Q?/y8GhEknmrP+MqUnyrrDnbCcTxGM5+MpKdYLP71ZBjZ3Xv+wksuyeA7rDCoZ?=
 =?us-ascii?Q?FLwHWAsDfpg2VE1lcPKySrtwVGle4weSI+988magH3dAkP900mnJEvg/H4qn?=
 =?us-ascii?Q?Ctv1bLhOygJOKMfW6tpf2Dlx1XVAX76++8/0MHeIToY8qrf55ZN8473fG5sv?=
 =?us-ascii?Q?bT15yS2UTtHaYLohxfk/1ozMnzEJmo/Ml7QfJoO+ltjViXhlLHii4M/NfLD9?=
 =?us-ascii?Q?slysUyHikxYShJ0vNWlS9SF6gUBU6iw3smIhZYS4rBffemiyNij4JnbuHefC?=
 =?us-ascii?Q?rW8Qf2nY+OqRcAJEdrbXGM1SaWTBwKT5/O3lId8s3OeUXtfpWA5piaWRbAWX?=
 =?us-ascii?Q?pNcssfv49vY+/updtLys1NpzrCIaja4HbUtBRMxEPEuIj/jlOa6+uRoTiL9f?=
 =?us-ascii?Q?7WwNvGYXEXNL59OSs90OxGZuhx31UqzHHQ4juGHL8K5Cg83nCTIufZ1ZdhLJ?=
 =?us-ascii?Q?SbQC4y6NaGjpzRPXw9hOVI2QfSohbRSPsiyxERa3c+1v7Mk+R+frGfsbjwR7?=
 =?us-ascii?Q?Kz62f4dIcZyESslE0kz3KWD9Zuz6Fb6lGdFuDuge+zt+MHULoWmO9RvyhN4I?=
 =?us-ascii?Q?GACHjqjhBJL4x19k2mM4YgsniJyCWz+xsT9LHE5ULYK8yoiyfSbcwUJo1e4Q?=
 =?us-ascii?Q?WKKEAvghtnjqABkG5rkpLjjA02lS1epe6eVn4viL6fPPH+f0FT8tLyLU96Ek?=
 =?us-ascii?Q?xysO8RBC/kYFhcFJkL4gMUxitXoQ9UHSU2nQTpp0c5bctDWOW7GzesRSkLCn?=
 =?us-ascii?Q?/r+WGEHujruwyzkB2//m/tmkLoNnjRo65/aQ9aKvE696xZmOL4tZAhshvUWC?=
 =?us-ascii?Q?tqGzU3YHhJN6vo2lFCHDCt8PUdqY8SVnmpY553Me0xK1o5ZonNP1DIvobqRg?=
 =?us-ascii?Q?u3/vVDHRaIfAuXuc/ByxX5JFuU+8UDIOuhSNwZuyzVMDFimHFBA/Ix0NOtgP?=
 =?us-ascii?Q?K34LD2uTUIkrsBoU0KFKN0HSoxeqSSOQiMqpEanacGU/WS5I69KYbQDdImVG?=
 =?us-ascii?Q?pF/puG4mFUQOht/NfdRwzd5VoLKJUydKXElUO/Yz6mtN/BOCx+6t7YNknycP?=
 =?us-ascii?Q?YHYoN5Yzca4l04FFsLM=3D?=
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR84MB1970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c39da5-b1ef-4b3c-05a1-08db5bbbe85b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 18:31:21.7743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Ud4r5rV7dH8I+XSvIHw0PACu0hY7RZKOETS8PWIus6irGzA9PkXrkJAM/twdxv1g48gcMWoXJ3t0s72SZZK/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1409
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

I investigate the compile failure and appears the latest patch reverted the=
 code to an older version.
The latest code shows the proper implementation and compiling the code does=
 not report any failures.

            enum hp_wmi_radio r =3D (long)data;

instead of=20

               enum hp_wmi_radio r =3D (enum hp_wmi_radio) data;



Regards,

Jorge Lopez


Regards,

Jorge Lopez
HP Inc

"Once you stop learning, you start dying"
Albert Einstein

From: kernel test robot <lkp@intel.com>=20
Sent: Saturday, May 20, 2023 4:30 PM
To: Lopez, Jorge A (Security) <jorge.lopez2@hp.com>
Cc: llvm@lists.linux.dev; oe-kbuild-all@lists.linux.dev; Sasha Levin <sasha=
l@kernel.org>; Hans de Goede <hdegoede@redhat.com>
Subject: [linux-stable-rc:queue/5.15 105/106] drivers/platform/x86/hp/hp-wm=
i.c:342:24: warning: cast to smaller integer type 'enum hp_wmi_radio' from =
'void *'

CAUTION: External Email=20
tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-r=
c.git queue/5.15
head: 632aeb02f8e831197a9a01b1e93cb00b4363be05
commit: 8d6ed410e942fa6f60e434729e1cbbc9ce0ccd54 [105/106] platform/x86: Mo=
ve existing HP drivers to a new hp subdir
config: x86_64-randconfig-x052
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c00=
6a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=3D1 build):
wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cro=
ss -O ~/bin/make.cross
chmod +x ~/bin/make.cross
# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.gi=
t/commit/?id=3D8d6ed410e942fa6f60e434729e1cbbc9ce0ccd54
git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/=
git/stable/linux-stable-rc.git
git fetch --no-tags linux-stable-rc queue/5.15
git checkout 8d6ed410e942fa6f60e434729e1cbbc9ce0ccd54
# save the config file
mkdir build_dir && cp config build_dir/.config
COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D1 O=3Dbu=
ild_dir ARCH=3Dx86_64 olddefconfig
COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D1 O=3Dbu=
ild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/platform/x86/hp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <mailto:lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305210504.yw7qgOom-lkp@i=
ntel.com

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/hp/hp-wmi.c:342:24: warning: cast to smaller intege=
r type 'enum hp_wmi_radio' from 'void *' [-Wvoid-pointer-to-enum-cast]
enum hp_wmi_radio r =3D (enum hp_wmi_radio) data;
^~~~~~~~~~~~~~~~~~~~~~~~
1 warning generated.


vim +342 drivers/platform/x86/hp/hp-wmi.c

f82bdd0d77b6bf drivers/platform/x86/hp-wmi.c Kyle Evans 2014-06-09 339=20
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg 2009-06-02 340 s=
tatic int hp_wmi_set_block(void *data, bool blocked)
62ec30d45ecbb8 drivers/misc/hp-wmi.c Matthew Garrett 2008-07-25 341 {
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins 2009-07-21 @342 e=
num hp_wmi_radio r =3D (enum hp_wmi_radio) data;
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins 2009-07-21 343 in=
t query =3D BIT(r + 8) | ((!blocked) << r);
6d96e00cef3503 drivers/platform/x86/hp-wmi.c Thomas Renninger 2010-05-21 34=
4 int ret;
62ec30d45ecbb8 drivers/misc/hp-wmi.c Matthew Garrett 2008-07-25 345=20
d8193cff33906e drivers/platform/x86/hp-wmi.c Darren Hart (VMware 2017-04-19=
 346) ret =3D hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_WRITE,
c3021ea1beeeb1 drivers/platform/x86/hp-wmi.c Anssi Hannula 2011-02-20 347 &=
query, sizeof(query), 0);
527376c89caf59 drivers/platform/x86/hp-wmi.c Darren Hart (VMware 2017-04-19=
 348)=20
527376c89caf59 drivers/platform/x86/hp-wmi.c Darren Hart (VMware 2017-04-19=
 349) return ret <=3D 0 ? ret : -EINVAL;
62ec30d45ecbb8 drivers/misc/hp-wmi.c Matthew Garrett 2008-07-25 350 }
62ec30d45ecbb8 drivers/misc/hp-wmi.c Matthew Garrett 2008-07-25 351=20

:::::: The code at line 342 was first introduced by commit
:::::: e5fbba85a7acc2626d4fe14501816811d702f3e9 hp-wmi: improve rfkill supp=
ort

:::::: TO: Alan Jenkins <mailto:alan-jenkins@tuffmail.co.uk>
:::::: CC: Len Brown <mailto:len.brown@intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

