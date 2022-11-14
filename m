Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26DD23A8;
	Mon, 14 Nov 2022 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668417433; x=1699953433;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=OL3EwMwmfvGi3Wdctj7Gosxx5UmerMBDjlJchvC6JcM=;
  b=M1781oa3bS7Use9GDv3LnSg0c3lY5tKrkSchasXbd2naDKh5byuqOSXH
   frFeXT6l73EboNVCssuBz7qb+BLuAXGvvL8syI0PU37FaOc1GU8j+Pr0J
   UoUG3A/3G+maEN1qd0lpnFIQIMJEuGsQ4lqQ7FF/BoXRuLxJlBE2eU+sz
   NhSUWAdsexnKYJI95xVvKRnBsNePD1lhrmRBMHYjgZL1JU0lb5GQc+nm3
   d/RMR0/daZbc45mgHMwMYE0B/MhxIddBEx1YsEFVlopQ+GgEuKRd+f1a8
   9dQVnbl8CAAbnU3oOoETqr3NzpAl1kZIxJrMQ1gsI6LEaDUE4EZzBXyXc
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="309548698"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="309548698"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 01:17:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="967496548"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="967496548"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.214.100]) ([10.254.214.100])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 01:17:10 -0800
Subject: Re: [helgaas-pci:pci/enumeration 3/3] drivers/pci/probe.c:909:6:
 warning: variable 'err' is used uninitialized whenever 'if' condition is true
To: Bjorn Helgaas <helgaas@kernel.org>, kernel test robot <lkp@intel.com>
Cc: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org
References: <20221108130816.GA464595@bhelgaas>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <c8c2f0ee-1f67-cdc0-da21-233dc7df4778@intel.com>
Date: Mon, 14 Nov 2022 17:17:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20221108130816.GA464595@bhelgaas>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/8/2022 9:08 PM, Bjorn Helgaas wrote:
> Why did the bot tell me the build was *SUCCESSFUL* even though this is
> clearly a problem?  Here's the "success" message:

Hi Bjorn,

Sorry about that, it's an internal bug in our service.

Best Regards,
Rong Chen

> 
>    https://lore.kernel.org/all/636a47ad.UocsB2qjv%2FcFWvK2%25lkp@intel.com/
> 
> On Tue, Nov 08, 2022 at 03:21:20PM +0800, kernel test robot wrote:
> 
>>>> drivers/pci/probe.c:909:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>>             if (bus->domain_nr < 0)
>>                 ^~~~~~~~~~~~~~~~~~
> 
> I set "err = -EINVAL" here; let me know if you prefer something
> different.
> 
