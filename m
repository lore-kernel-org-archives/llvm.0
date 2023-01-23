Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537D57C
	for <llvm@lists.linux.dev>; Mon, 23 Jan 2023 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674472546; x=1706008546;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xCgElu63hiEX8PZSg1x7apvUzWPg+SYGm2cwSlK2h8o=;
  b=iw2QEe3VrIqP7X6fvROkckAuub3H46LU7oYLNLaZC0rFcLgytLGSM1SU
   oT8i2+l4DYPqb8mu6el5cfpUDML6TaOb8p1gnqkmyKRJXzzzX3iP0MgIB
   FWdKD/krSxTHY1fycqGa0JLDzpzlcvApMN9gad2GdkNDEhZZAVrAqv6fr
   7nXd7EBLBA0woQ7GEwq2j5K2vW5rrL75ypHIWJURQbhQoxGYwDfKH/PJU
   F82lpPrftMI7Qfv9KPs7+6Xlelf0tRvOz97Czd3xisMwm0C/I7erR78Kw
   bg0tm0pF3adxJQhGQtsWnYUTp64Q/D+/LOWGiJqboW/jtPHTCfR7qfAx3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="309595491"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="309595491"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 03:15:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="804055292"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="804055292"
Received: from naamamex-mobl.ger.corp.intel.com (HELO [10.13.12.3]) ([10.13.12.3])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 03:15:41 -0800
Message-ID: <59a81c79-7770-7673-5ebd-d79c44824554@linux.intel.com>
Date: Mon, 23 Jan 2023 13:15:26 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-wired-lan] [PATCH] igc: return an error if the mac type is
 unknown in igc_ptp_systim_to_hwtstamp()
To: Tom Rix <trix@redhat.com>, jesse.brandeburg@intel.com,
 anthony.l.nguyen@intel.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 nathan@kernel.org, ndesaulniers@google.com, vinicius.gomes@intel.com,
 jeffrey.t.kirsher@intel.com
Cc: netdev@vger.kernel.org, llvm@lists.linux.dev,
 intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org
References: <20230114140412.3975245-1-trix@redhat.com>
Content-Language: en-US
From: "naamax.meir" <naamax.meir@linux.intel.com>
In-Reply-To: <20230114140412.3975245-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/14/2023 16:04, Tom Rix wrote:
> clang static analysis reports
> drivers/net/ethernet/intel/igc/igc_ptp.c:673:3: warning: The left operand of
>    '+' is a garbage value [core.UndefinedBinaryOperatorResult]
>     ktime_add_ns(shhwtstamps.hwtstamp, adjust);
>     ^            ~~~~~~~~~~~~~~~~~~~~
> 
> igc_ptp_systim_to_hwtstamp() silently returns without setting the hwtstamp
> if the mac type is unknown.  This should be treated as an error.
> 
> Fixes: 81b055205e8b ("igc: Add support for RX timestamping")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/net/ethernet/intel/igc/igc_ptp.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
Tested-by: Naama Meir <naamax.meir@linux.intel.com>
