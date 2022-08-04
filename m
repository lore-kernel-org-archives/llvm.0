Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D419D7F
	for <llvm@lists.linux.dev>; Thu,  4 Aug 2022 09:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659606706; x=1691142706;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1mAFulNWoLFTDJufnr4AN2fWHLLvDVf708xkkVeQJ1E=;
  b=A8bJGGYL/Xu342Rp5KPyAEt52ziQVb9Sbl5XtjdUdCbcS9XCPQxdj48X
   o+nCnuPukOG/QoAZvY2it/Jq7ttP3NCCZaCcyuP6mJ3vPUEGkgotH0ZXq
   nnhMG0LWPJwQySLAautOsH8JwBkxHQ78WPepHgg55hNUvCaoitcDX6nQK
   5THKaoDDv8T0aKmbbU9RYQ02bVuBrio1bLN8rAaO8rL9YAlxWPxXt7DiK
   zPCj+09f0s5wBJBHrXnBd4SlWZFWNQUcJ3mYO4V5KROXp5YDl39rTkuRJ
   UlKchM/vnRSdYdxFhAeI4Z8cAu46pOXGv9u5qTBTuJlct7YDaPo/dFnBe
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="289904751"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; 
   d="scan'208";a="289904751"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 02:51:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; 
   d="scan'208";a="745405452"
Received: from mpcastil-mobl2.amr.corp.intel.com (HELO [10.249.40.52]) ([10.249.40.52])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 02:51:34 -0700
Message-ID: <43ada0d7-f094-7f63-3717-30c64834edd6@linux.intel.com>
Date: Thu, 4 Aug 2022 11:47:46 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH resend] ASoC: SOF: ipc3-topology: Fix clang -Wformat
 warning
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Justin Stitt <justinstitt@google.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 llvm@lists.linux.dev, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Tom Rix <trix@redhat.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20220803204442.2996580-1-justinstitt@google.com>
 <Yure82N7/4NLEMsW@dev-arch.thelio-3990X>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Yure82N7/4NLEMsW@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/3/22 15:47, Nathan Chancellor wrote:
> On Wed, Aug 03, 2022 at 01:44:42PM -0700, Justin Stitt wrote:
>> When building with Clang we encounter these warnings:
>> | sound/soc/sof/ipc3-topology.c:2343:4: error: format specifies type
>> | 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
>> |                  SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
>> |                  ^~~~~~~~~~~~~~~^~~~~~~~~~~~~~~^~~~~~~~~~~~~
>>
>> Use correct format specifier `%d` since args are of type int.
>>
>> Link: https://github.com/ClangBuiltLinux/linux/issues/378
>> Reported-by: Nathan Chancellor <nathan@kernel.org>
>> Suggested-by: Nathan Chancellor <nathan@kernel.org>
>> Signed-off-by: Justin Stitt <justinstitt@google.com>
> 
> Thanks for resending!
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
>> ---
>> Note: resending with the subject corrected, this patch fixes a build
>> warning that will break the Clang build when CONFIG_WERROR=y.
>>
>> Original patch: https://lore.kernel.org/all/20220721211218.4039288-1-justinstitt@google.com/
>> Reported by Nathan here: https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/
>>
>>  sound/soc/sof/ipc3-topology.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
>> index b2cc046b9f60..65923e7a5976 100644
>> --- a/sound/soc/sof/ipc3-topology.c
>> +++ b/sound/soc/sof/ipc3-topology.c
>> @@ -2338,7 +2338,7 @@ static int sof_ipc3_parse_manifest(struct snd_soc_component *scomp, int index,
>>  	}
>>  
>>  	dev_info(scomp->dev,
>> -		 "Topology: ABI %d:%d:%d Kernel ABI %hhu:%hhu:%hhu\n",
>> +		 "Topology: ABI %d:%d:%d Kernel ABI %d:%d:%d\n",
>>  		 man->priv.data[0], man->priv.data[1], man->priv.data[2],
>>  		 SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
>>  
>> -- 
>> 2.37.1.359.gd136c6c3e2-goog
>>
