Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9E73C37
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 20:58:18 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id a10so15125388ljj.5
        for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 13:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MiQ+xQxx8hd0dlOeoQTIZgHydZebknID1GX7TXEZwqY=;
        b=UXe8Cf2JLOSGbf9v+WHy5ow7tsX4GzUvDFhUAw4qsj86k+3sd8z+PTBhrJqCT64GOB
         vlJP5xyX+3SnkFvEPX7q2tjxrYwW7oPoKSwe03WAxTwyuxLVNewsJlodCViVgrkVGIrc
         JojBGrNyo4qc9W7bJODpPBqt7bX1uijY5sD7E4OlMYo5Eru8cRZCO3uUzLA2vZX+cxPh
         ZSFbBi3GMNWelh4qZ2/ECU2pSwTqhujohHLiYwDwCRsOe7X1nUNXpG1khIP/h/ohwRX8
         6jNSahP4U8pUBsP26GpgD2lf36mMTjkvdcVz4X0bZW4CArL1q37WzWw4+POFiTs5g+Hc
         Ou2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MiQ+xQxx8hd0dlOeoQTIZgHydZebknID1GX7TXEZwqY=;
        b=22ZATH7lPYoDJn6KvWZNgETFhOPqSLK+CrGMeLYgxqI/tkkSQCZ95AGmWW5BLNb7G+
         qCbMzUBq9MDc4nhauAsBjSxDBqPZOtwoZoKc0V1tbJQR2mr4rfpHWkAV+a0Yk0aE26qS
         rQ0i4U14MmEaCREVnh8cEaQ2ayarUbo5xZ9mb+EKAkg5VNrm6PfP+uUc3ow52HwDCXj0
         yv0mlMyI3mnsm9HRoplzisPdMLdMk1zhF0L67UJXI3c5yIP7ygJ3Rm1ebnqsBv8typuM
         7tyTaPnCOb2rPwGFQuK1Wpwdlxqcl3PySVX3z+fHS2569DQACBqLx5QCDCQAO0mmLBkQ
         zkLg==
X-Gm-Message-State: AJIora+FWsve5BjozdbYTmJ/FJudV9mARdAeMCXy/auQ7klycarZ5kHW
	u2rBwAeoC0t4+CV6Sk5XcspT/n5K3+dmIv6G37TUIw==
X-Google-Smtp-Source: AGRyM1t51RWTLgYvPAUANqa/emkL/JY9rxxZTykAFTNHaWCbZ02W5NqJ5SzgkzMSkS2CC69AQN7HvjqAYJHsNPJ++QA=
X-Received: by 2002:a2e:a5cb:0:b0:25d:7a70:2891 with SMTP id
 n11-20020a2ea5cb000000b0025d7a702891mr13859068ljp.295.1658177896827; Mon, 18
 Jul 2022 13:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220711222919.2043613-1-justinstitt@google.com>
In-Reply-To: <20220711222919.2043613-1-justinstitt@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 18 Jul 2022 13:58:05 -0700
Message-ID: <CAKwvOd=P7Wv0Z5YuxkwiqGfXGav9nZsBiC3mxdy0UfyF8D_c8A@mail.gmail.com>
Subject: Re: [PATCH] iwlwifi: mvm: fix clang -Wformat warnings
To: Justin Stitt <justinstitt@google.com>
Cc: Gregory Greenman <gregory.greenman@intel.com>, Kalle Valo <kvalo@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Luca Coelho <luciano.coelho@intel.com>, Johannes Berg <johannes.berg@intel.com>, 
	Avraham Stern <avraham.stern@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 11, 2022 at 3:29 PM Justin Stitt <justinstitt@google.com> wrote:
>
> When building with Clang we encounter these warnings:
> | drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c:1108:47: error:
> | format specifies type 'unsigned char' but the argument has type 's16'
> | (aka 'short') [-Werror,-Wformat] IWL_DEBUG_INFO(mvm, "\tburst index:
> | %hhu\n", res->ftm.burst_index);
> -
> | drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c:1111:47: error:
> | format specifies type 'unsigned char' but the argument has type 's32'
> | (aka 'int') [-Werror,-Wformat] IWL_DEBUG_INFO(mvm, "\trssi spread:
> | %hhu\n", res->ftm.rssi_spread);
>
> The previous format specifier `%hhu` describes a u8 but our arguments
> are wider than this which means bits are potentially being lost.
>
> Variadic functions (printf-like) undergo default argument promotion.
> Documentation/core-api/printk-formats.rst specifically recommends using
> the promoted-to-type's format flag.
>
> As per C11 6.3.1.1:
> (https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf) `If an int
> can represent all values of the original type ..., the value is
> converted to an int; otherwise, it is converted to an unsigned int.
> These are called the integer promotions.` Thus it makes sense to change
> `%hhu` to `%d` for both instances of the warning.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c b/drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c
> index 430044bc4755..e8702184c950 100644
> --- a/drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c
> +++ b/drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c
> @@ -1105,10 +1105,10 @@ static void iwl_mvm_debug_range_resp(struct iwl_mvm *mvm, u8 index,
>         IWL_DEBUG_INFO(mvm, "\tstatus: %d\n", res->status);
>         IWL_DEBUG_INFO(mvm, "\tBSSID: %pM\n", res->addr);
>         IWL_DEBUG_INFO(mvm, "\thost time: %llu\n", res->host_time);
> -       IWL_DEBUG_INFO(mvm, "\tburst index: %hhu\n", res->ftm.burst_index);
> +       IWL_DEBUG_INFO(mvm, "\tburst index: %d\n", res->ftm.burst_index);
>         IWL_DEBUG_INFO(mvm, "\tsuccess num: %u\n", res->ftm.num_ftmr_successes);
>         IWL_DEBUG_INFO(mvm, "\trssi: %d\n", res->ftm.rssi_avg);
> -       IWL_DEBUG_INFO(mvm, "\trssi spread: %hhu\n", res->ftm.rssi_spread);
> +       IWL_DEBUG_INFO(mvm, "\trssi spread: %d\n", res->ftm.rssi_spread);
>         IWL_DEBUG_INFO(mvm, "\trtt: %lld\n", res->ftm.rtt_avg);
>         IWL_DEBUG_INFO(mvm, "\trtt var: %llu\n", res->ftm.rtt_variance);
>         IWL_DEBUG_INFO(mvm, "\trtt spread: %llu\n", res->ftm.rtt_spread);
> --
> 2.37.0.144.g8ac04bfd2-goog
>


-- 
Thanks,
~Nick Desaulniers
