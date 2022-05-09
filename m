Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5288A1865
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 10:37:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQofRJEXOEtSu7J5sVykoOA/liUdSe4FWEqUHqrtslP9r2ZkpionqrY25BqxaaoZPEdgsC9xqyqKZNjQzGv6ewuVYd0OVyIiGpen/iG7U7hjX7asFyuJ7Ca1rsLYWg9Jz93def7PXjm3ZLvMXpFAWXTUH5rKSNcaTAzEl8XWRW40Uqye02Yd2nIFK4mVnlbrvaeWAnw/kcQ12wQBwaMJLcsn5lnn2xa4FRDWkRHYaZKU8Ceeug+z7e7Dx3g4IXv0oXhE2ivJmF5VwZrtqM1on60NNl8yqln2HUX2QVJkpI3YD7OKglLXzBtwTDSxT7pClhTY9KI7nGn94+VtnJ4hww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edzKLLIUYYLgI5XbYaPQP8V65vVHov96KsWWX9uRE3g=;
 b=c6dIsI1kErqpLFzD9y+wjqVgVrRY0QecAciVsluSF0C0L0V5+1pjp3xgsiiBICQpokPSJil8huybdlPIc934NvObw5CdW79JO1xoPdyccmtL5FI64kC0t9lHRdutp01HKkaaZyl7Wkq6ugCxoh6EeOIlKI7/wsvSKZe84FKUPAh9I4FKcugUaKy5FGoMNbWt3FwpjUvskbp5FWXQ2ktmUgslOj88aN+vCTi55Ctaa2SVOUrkm8Vi8SiNtruafEY8QY5fHRHkvnWEMNmFYymL0WEfa5MKosglT8CL7IHhopGMy7f7jTUSzdDNQZFawGjOIqZbtqXsnOWY037CcO1qFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=lists.01.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edzKLLIUYYLgI5XbYaPQP8V65vVHov96KsWWX9uRE3g=;
 b=DjV/6f0OaJqnu4OMqinGKwBMo6ElvMQdoetS1vcJvqoKSXT2NBfnTUbnLpgyrTeM06cGnCjbi+h7Q+BenkxVtPBMtmCgBh1+fnlUS+YYmJTGRM5+d/3zqk1W1H0iN7RtA3Rr/60BKNM346DC8v3ehxYzw7zQPE+sTW2NOnsIgv6JppPn0lpIKO5mnMPcSJ+S8KVNJHTZJA0B3vsZYX1nrUelqt6PoENSkJn7LzZiTrnOC0yZ/oob6FZcWoa2Q7O2BJrSqtvRNfbVW52n2x0H/2x+R7Z/7otJdUo8ppBMzMPAqUOlZXyT0N/T/izGUy98x7odhRxieAbKgImQ4Mq5dA==
Received: from BN9PR03CA0430.namprd03.prod.outlook.com (2603:10b6:408:113::15)
 by DM5PR12MB1788.namprd12.prod.outlook.com (2603:10b6:3:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Mon, 9 May
 2022 10:37:50 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::f5) by BN9PR03CA0430.outlook.office365.com
 (2603:10b6:408:113::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Mon, 9 May 2022 10:37:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 10:37:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 9 May
 2022 10:37:49 +0000
Received: from [10.41.21.79] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 9 May 2022
 03:37:47 -0700
Message-ID: <696884f5-b0a1-f6e4-8fe0-49a90d4db337@nvidia.com>
Date: Mon, 9 May 2022 16:07:44 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Patch v4 9/9] soc: tegra: cbb: Add support for tegra-grace SOC
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>, Sumit Gupta
	<sumitg@nvidia.com>
References: <20220505170637.26538-10-sumitg@nvidia.com>
 <202205061255.rw9iNJAz-lkp@intel.com>
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <202205061255.rw9iNJAz-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b8333e4-45eb-4e25-733f-08da31a7f6f5
X-MS-TrafficTypeDiagnostic: DM5PR12MB1788:EE_
X-Microsoft-Antispam-PRVS:
 <DM5PR12MB1788CEA2818276933269DC38B9C69@DM5PR12MB1788.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	phm8Gig3z3Q7afHiIqYXcWvZP/4u+GQzpgdDw+44SaOOpThMb8e/ymIvQxqrIQ1m/+YE5FO2V0Q6zyWH9zpfudUoR3Hdx/fC25FRstRemrKalNCEGwVf8IfKeSa6o6XHZrfU2dR3leKE//QcUj8zUt0PyCt/lGyjkUtSDznb8BdLdji8fVJxowk2vHLVZO1r4N8lLvGz0NJahfu+NDkHHL872eN+HdlkZhliVEKSh5zBbtW8SIDfiDo6QlKQdciobH58v2XyQInTaMsI1YdsnLsknnvKTC3sFLpGQq5wX3mPZheVNgCqEql5PfOQq0we06qqneHLvp4iKKigIdPFWR2xqijrOkItrGJWoRkLSj/Zy5VLF9cenHbteF980KajHGxLDM396FSOE6pAzrX9cCKWJTtf4iu+TGWsuAEfsYC5l8SOj5yaMJxqrANfbVD+SflwwY8hLyoYtQJVqugNGnNOQaoOfMYmrgtuJrbqcO0TcvzrWDfqyRPmpKUFTmJiNekXRDBooooS66EA/Ql6wgAXSZFVOLcnRVj8DEkKAwl4qcExV1FJOicsOaLNf0iy0JRogRYavkL67MfXrv/nfA+b1/806VkisOecJwPc2zgXMYErHe26+OzP+OfY7XDQ+fatMRVDfo4GORYUCtzkLR1K8jw4H0dsxAkHYDwgp6QPwiwy8i1XbD8eKa3Yu0JSKiRmPokz7JptHFzM73ATupeePojX1t5Z2bB7ifXMm1ONqZsJ3lPzNc1OCGLGwbZR92Lj2XhBZiydxFHRBOTZUk+SIECcpZbjrplxjTaSPpKKc6GMhrD8nxM/zKm0Ui0CXLJAirEJs/n6e4a2O75p2SpwBiRn+mFvXR5eh703E1k=
X-Forefront-Antispam-Report:
	CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(966005)(36860700001)(508600001)(6916009)(54906003)(16576012)(356005)(316002)(40460700003)(81166007)(86362001)(31686004)(4326008)(31696002)(8676002)(70206006)(53546011)(83380400001)(26005)(6666004)(5660300002)(70586007)(186003)(36756003)(16526019)(107886003)(2616005)(336012)(82310400005)(8936002)(2906002)(47076005)(426003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 10:37:49.7364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8333e4-45eb-4e25-733f-08da31a7f6f5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1788



On 06/05/22 09:52, kernel test robot wrote:
> External email: Use caution opening links or attachments
> 
> 
> Hi Sumit,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on tegra/for-next]
> [also build test WARNING on robh/for-next v5.18-rc5 next-20220505]
> [cannot apply to tegra-drm/drm/tegra/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Sumit-Gupta/CBB-driver-for-Tegra194-Tegra234-Tegra-Grace/20220506-010937
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
> config: arm64-randconfig-r033-20220505 (https://download.01.org/0day-ci/archive/20220506/202205061255.rw9iNJAz-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install arm64 cross compiling tool for clang build
>          # apt-get install binutils-aarch64-linux-gnu
>          # https://github.com/intel-lab-lkp/linux/commit/ba92bd64d05fc7383dce973c2428eca5b4c65805
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Sumit-Gupta/CBB-driver-for-Tegra194-Tegra234-Tegra-Grace/20220506-010937
>          git checkout ba92bd64d05fc7383dce973c2428eca5b4c65805
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/soc/tegra/cbb/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>     drivers/soc/tegra/cbb/tegra234-cbb.c:726:17: warning: unused variable 'dev' [-Wunused-variable]
>             struct device *dev = &pdev->dev;
>                            ^
>>> drivers/soc/tegra/cbb/tegra234-cbb.c:664:36: warning: unused variable 'tegra_grace_cbb_acpi_ids' [-Wunused-const-variable]
>     static const struct acpi_device_id tegra_grace_cbb_acpi_ids[] = {
>                                        ^
>     2 warnings generated.
> 
Thankyou for the report.
I have included the fix and posted v5.

> 
> vim +/tegra_grace_cbb_acpi_ids +664 drivers/soc/tegra/cbb/tegra234-cbb.c
> 
>     663
>   > 664  static const struct acpi_device_id tegra_grace_cbb_acpi_ids[] = {
>     665          { "NVDA1070" },
>     666          { },
>     667  };
>     668  MODULE_DEVICE_TABLE(acpi, tegra_grace_cbb_acpi_ids);
>     669
>     670  static const struct
>     671  tegra_cbb_fabric_data *cbb_acpi_get_fab_data(struct acpi_device *adev)
>     672  {
>     673          const struct cbb_acpi_uid_noc *u;
>     674
>     675          for (u = cbb_acpi_uids; u->hid; u++) {
>     676                  if (acpi_dev_hid_uid_match(adev, u->hid, u->uid))
>     677                          return u->fab;
>     678          }
>     679          return NULL;
>     680  }
>     681
>     682  static int
>     683  tegra234_cbb_errmon_init(const struct tegra_cbb_fabric_data *pdata,
>     684                           struct tegra_cbb *cbb, struct resource *res_base)
>     685  {
>     686          struct platform_device *pdev = cbb->pdev;
>     687          struct tegra_cbb_errmon_record *errmon;
>     688          unsigned long flags = 0;
>     689          int err = 0;
>     690
>     691          errmon = (struct tegra_cbb_errmon_record *)cbb->err_rec;
>     692          errmon->vaddr = devm_ioremap_resource(&pdev->dev, res_base);
>     693          if (IS_ERR(errmon->vaddr))
>     694                  return -EINVAL;
>     695
>     696          errmon->name = pdata->name;
>     697          errmon->start = res_base->start;
>     698          errmon->tegra_cbb_master_id = pdata->tegra_cbb_master_id;
>     699          errmon->err_notifier_base = pdata->err_notifier_base;
>     700          errmon->off_mask_erd = pdata->off_mask_erd;
>     701          errmon->sn_addr_map = pdata->sn_addr_map;
>     702          errmon->noc_errors = pdata->noc_errors;
>     703          errmon->cbb = cbb;
>     704
>     705          if (errmon->off_mask_erd)
>     706                  errmon->erd_mask_inband_err = 1;
>     707
>     708          err = tegra_cbb_err_getirq(pdev, NULL, &errmon->sec_irq);
>     709          if (err)
>     710                  return err;
>     711
>     712          cbb->ops = &tegra234_cbb_errmon_ops;
>     713
>     714          spin_lock_irqsave(&cbb_errmon_lock, flags);
>     715          list_add(&errmon->node, &cbb_errmon_list);
>     716          spin_unlock_irqrestore(&cbb_errmon_lock, flags);
>     717
>     718          return 0;
>     719  };
>     720
>     721  static int tegra234_cbb_probe(struct platform_device *pdev)
>     722  {
>     723          struct tegra_cbb_errmon_record *errmon = NULL;
>     724          const struct tegra_cbb_fabric_data *pdata = NULL;
>     725          struct resource *res_base = NULL;
>   > 726          struct device *dev = &pdev->dev;
>     727          struct acpi_device *device;
>     728          struct tegra_cbb *cbb;
>     729          int err = 0;
>     730
>     731          if (of_machine_is_compatible("nvidia,tegra23x") ||
>     732              of_machine_is_compatible("nvidia,tegra234")) {
>     733                  pdata = of_device_get_match_data(&pdev->dev);
>     734          } else {
>     735                  device = ACPI_COMPANION(dev);
>     736                  if (!device)
>     737                          return -ENODEV;
>     738                  pdata = cbb_acpi_get_fab_data(device);
>     739          }
>     740          if (!pdata) {
>     741                  dev_err(&pdev->dev, "No device match found\n");
>     742                  return -EINVAL;
>     743          }
>     744
>     745          res_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>     746          if (!res_base) {
>     747                  dev_err(&pdev->dev, "Could not find base address");
>     748                  return -ENOENT;
>     749          }
>     750
>     751          cbb = devm_kzalloc(&pdev->dev, sizeof(*cbb), GFP_KERNEL);
>     752          if (!cbb)
>     753                  return -ENOMEM;
>     754
>     755          errmon = devm_kzalloc(&pdev->dev, sizeof(*errmon), GFP_KERNEL);
>     756          if (!errmon)
>     757                  return -ENOMEM;
>     758
>     759          cbb->err_rec = errmon;
>     760          cbb->pdev = pdev;
>     761          err = tegra234_cbb_errmon_init(pdata, cbb, res_base);
>     762          if (err) {
>     763                  dev_err(&pdev->dev, "cbberr init for soc failing\n");
>     764                  return err;
>     765          }
>     766
>     767          /* set ERD bit to mask SError and generate interrupt to report error */
>     768          if (errmon->erd_mask_inband_err)
>     769                  tegra234_cbb_mn_mask_serror(cbb);
>     770
>     771          platform_set_drvdata(pdev, cbb);
>     772
>     773          return tegra_cbb_register_isr_enaberr(cbb);
>     774  }
>     775
> 
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
