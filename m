Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF992C80
	for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 06:58:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+Xeh/+8vGlgilQ5PZVN69MEcKNqqbx2+gZCWafJkrbSWzcf/IHD8pi3KEyyPMIicgk+qo00rFLtumF5rlvmswgUP0c+f63FsYS87X3uSc7Z+03yZC6iBdqgBpMHyATFGDiY03BVQt6q6G/u1cY3OdNf2FX135a23YuKp7Gdcpa9BOAsO0k9hqxPWPRkF+2ziCJrbKkycmoQG9RE93BIY9tzht9Fj8cbdA61oZuvB+9tnR11nxlUIaPtoJmc6zTMGRlujLyvd1KKZQFDQjCYO3uz40vbCES1AjZadbk5vYsSHmWkSne0SEMjFNqSID+9ajl9pcddLlHOJx6GJ9XsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiwyHIza3NRzNfgj9d1YVcktfm7JbfQaa3qlZTioeE4=;
 b=D8NvrWpJnMlSk1oEccfCk4hbQRmkIHH6i14jsDg0yXENXusDkjL5zsnjG+RO88wQR7nu+f98BHPS8CV6vSxgqjyc2Fm9sLqUTTiKzklN18RFYNCnLofOX7hwBXHRYu8jeONw0DQaxqK6bX/wDArnVzdAVGV9eEc5M+KtVIvBQhbRrBs3xxlA7hR5qwVdYVuTaqEnMv+lJTqldmamraYRo4EMn2Fh8GaOYRLyh7tI8uxM3umN47TOYMVpABSAoyjjy3sBAgesLVb6s4FnjhhoqjwUxwFjuixTke6UpHbLpIWTBtw39Q10r1Syyqluf2xBVMo+ChmvcYSyevRg0chn5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiwyHIza3NRzNfgj9d1YVcktfm7JbfQaa3qlZTioeE4=;
 b=l68qULr7KIYRVPIzIOZhOeXdgAFLBPotzzyyWE/uuwVAosO/Unplsu3eztiJUhGKvy+ehGJLs5ojBF/NKeZMYOYX2FFK+N9OY5KJGrnKP2JaOGEl116IB9uAu7aJyoX9N0p+PW8xaIz4xzgxg3SBA7fmdSIYidE4adu/MdqXrIftIv5K5XutIuYaFTqxuxhB51kGC5Md9kdFbHqSksZGptooP6xRKdjpB6bnc0b3JV2la2IjJtXp8xhQyi9+1nBslbpnSgLZFuSsr/GrF8/us/OHOGPEP5Q8UPSDOcKh2NWorlB4QVIwU5ZtyhNULTjuEVxMBVIFl/uSZOFqqE6grw==
Received: from MW4P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::28)
 by MN2PR12MB3038.namprd12.prod.outlook.com (2603:10b6:208:cb::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 06:58:43 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::e) by MW4P223CA0023.outlook.office365.com
 (2603:10b6:303:80::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9 via Frontend
 Transport; Mon, 10 Jan 2022 06:58:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4867.9 via Frontend Transport; Mon, 10 Jan 2022 06:58:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 10 Jan
 2022 06:58:42 +0000
Received: from mtl-vdi-166.wap.labs.mlnx (10.127.8.10) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9;
 Sun, 9 Jan 2022 22:58:39 -0800
Date: Mon, 10 Jan 2022 08:58:36 +0200
From: Eli Cohen <elic@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Si-Wei Liu <si-wei.liu@oracle.com>, Nathan Chancellor <nathan@kernel.org>,
	<jasowang@redhat.com>, <virtualization@lists.linux-foundation.org>,
	<lvivier@redhat.com>, <eperezma@redhat.com>, <llvm@lists.linux.dev>
Subject: Re: [PATCH v7 07/14] vdpa/mlx5: Support configuring max data
 virtqueue
Message-ID: <20220110065836.GA103280@mtl-vdi-166.wap.labs.mlnx>
References: <20220105114646.577224-1-elic@nvidia.com>
 <20220105114646.577224-8-elic@nvidia.com>
 <99150f0c-6814-a0cc-8640-aa8014af6ed0@oracle.com>
 <YdiABvwrK3WxfHqb@archlinux-ax161>
 <233b923b-e6e2-0d47-8230-df91a35ee4de@oracle.com>
 <20220110015040-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220110015040-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [10.127.8.10]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e87ef95-3725-4f72-2485-08d9d406a385
X-MS-TrafficTypeDiagnostic: MN2PR12MB3038:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR12MB3038C2C71B0AAC2DBF7CC2B7AB509@MN2PR12MB3038.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XOLg/OZclyuQNan0jt1IG4djpEAjkGvjNRXcbwHbSaOofFwbJqLFEle0GIozQyrMPTfVO+4eP5JZ9Lmofr8sI2nzMLLW1mLPRi3FMPk5PYjCZVKzLke3Q9iDkOKgRIsYKm02HbqDajVgDtZTsk6rhR0ndjjZIGenJHeMbe6zhKQM8EdtV/6onezgkjsc/o0AMf4x4/VlQy62AigLx9LjoWmM0zTSUf9ZdgPuhyxhPxNlyEHCAGHJekWXuWMMiZQx2bXPS8FKj2zj+cnjuRQGYW/XQqmAYX73z8X2J/IrU3R2FWWA/lf8OOQjkokF2645r/gOkJJbpp/4kPzD8eMlPxU817rb4kbmUHUuM3d8/uQ7eTNdL1xB4mBpcLW/OU/tIgK5Zvl8ldBsQ6w27UpH3TeGiS4UqSdSdPbdYoOpd2bpAjuVKFnXJLLb0N5tW7ybAGaJgKplaqqmLlqldWRwf8kgjWwvUNhUA0HnpcnsjdRCCMz5uaYFuiVgnPB6shNyPAMgbjYe/nk2m3gCtVyk6NO9mZ1KRwEzxObj+/nx9/Hq0cmNXo4k2INX44I+gtu4W+i84RomNi9s0v5W08a6yZT5/6ROBtbD+ej2XaRYOnSlTd/mRnQ6/YJqDVbWjXmTqK/pwHF1wKqcFY+tzQUIE4bnxycwjdPVXIqHvYRn8HHq/vSLYYvENkvmH4qtNhqikVV86ZvrTJ3UbguO31zlOdTQn7gqm0mgj/RXpqF488jjV7gGGl2k1yJiXKpnq63GTo19b1suJO300A8EGzX7zwIX8HpSSq08GqqIiEyxM3A=
X-Forefront-Antispam-Report:
	CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700002)(8936002)(6916009)(40460700001)(86362001)(33656002)(2906002)(8676002)(426003)(47076005)(336012)(16526019)(82310400004)(186003)(55016003)(26005)(4326008)(356005)(70206006)(81166007)(316002)(54906003)(4744005)(6666004)(36860700001)(9686003)(1076003)(70586007)(7696005)(5660300002)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 06:58:42.6846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e87ef95-3725-4f72-2485-08d9d406a385
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3038

On Mon, Jan 10, 2022 at 01:53:04AM -0500, Michael S. Tsirkin wrote:
> On Fri, Jan 07, 2022 at 05:43:15PM -0800, Si-Wei Liu wrote:
> > It's unfortunate. Don't know why this series got pulled into linux-next
> > prematurely. The code review is still on going and there were outstanding
> > comments that hadn't been addressed yet.
> 
> Most patches got acked, and the merge window is closing.
> The only couple of issues seem to be with this specific patch, and I
> think I fixed them up.
> Still - I can hold them if necessary. What do others think?

Well, you could argue that I am not objective, but I think we should
keep them since they address all interface related concerns raised and
they work.

> 
> -- 
> MST
> 
