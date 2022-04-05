Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38060321B
	for <llvm@lists.linux.dev>; Tue,  5 Apr 2022 18:01:46 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id h11so69220ljb.2
        for <llvm@lists.linux.dev>; Tue, 05 Apr 2022 11:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UtPjO+bxq+tkrbVKUaDcJXid+W/QeCc20ZhEe/m6WHk=;
        b=Xq6IZspRICfswBPKfRG9/rkA8zzqUrYc8AEaIS7BqLjxD8XxrJt/TSd6TeV+PoOh+x
         TWLTo87XR/66DLc3P6r3wOUKYiKC5VWuBkx+6ER1S5fqR8uVVLbE/Mnt/gH1EKOF0zMl
         EMq7iQ4CLUD2xX1/ZT+FGVsskv4zGNk9k0kI+FnwBzf1dA/sQfweLGYAVlAZk6QClzZ1
         nobRJrADpU/Tz+gYnl+iHQu9q539LiyMt0IlZ6xFi6lJArxzxWE3TK8eslO84swXM4xa
         I4CGW7Vw9/WAuQl2A2SW1HyL4qebDsG468bz3mFPIUYcQxmjKImFm9B12ojvWxmqxxY5
         SfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UtPjO+bxq+tkrbVKUaDcJXid+W/QeCc20ZhEe/m6WHk=;
        b=2XaMVQRAaSgJGwJeVCoqg+tqX2pUQt0ebzg+xPM8vv9g7xSxJ9ux+E0HftbG+mK/Wm
         I0O1R1OzhYf3ZbVgJjsew94menXRBzWDjm4+xL4nMhA5D0Vpb7DhNn4uqj4X2VbgyMsK
         R703pHl4frsBcHpDIqkGT560DxA71hFeI+7bb+ewsDvgh50EPJulvjeRzw2SmIxnI+kx
         M3QYcQHbiYp/amNbQKAIuB6kRlu0EwDYhRY3+EPeYx/X3+tsWmBJvgiJUNlMPkSiHYEn
         P9YFUjLVFMR9EyrgtDx+hxtWscTl/+H+0uKSP2Au/ZhUpGOW89WApTu1CV/K8Ps4Dr3n
         6Ssg==
X-Gm-Message-State: AOAM533DwoTNaQXJpz/zwXn/lfUMOHlB+BIUjGePiVdCDaWk9e222Oo/
	XLf+8BQsVs+ollcF8gDNwyurfUj/dfD8Y9XPFArWgw==
X-Google-Smtp-Source: ABdhPJxmwIX/bZD6HHeBC8Mgm7SLI3AbupPtrtLQAue+dvE6QpFk1/V9rIQtTW8xUGyHm5vacR8kUrbKGxc6La1y6Es=
X-Received: by 2002:a2e:b70d:0:b0:24b:11d8:8e63 with SMTP id
 j13-20020a2eb70d000000b0024b11d88e63mr2819981ljo.472.1649181704075; Tue, 05
 Apr 2022 11:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220401233802.1710547-1-trix@redhat.com>
In-Reply-To: <20220401233802.1710547-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Apr 2022 11:01:32 -0700
Message-ID: <CAKwvOdkkfdjuNLzWimi+Q_PSD9T4ZxumBb+28g1vDbUX0VQVcg@mail.gmail.com>
Subject: Re: [PATCH] iwlwifi: fw: move memset before early return
To: Tom Rix <trix@redhat.com>
Cc: luciano.coelho@intel.com, kvalo@kernel.org, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org, 
	johannes.berg@intel.com, mukesh.sisodiya@intel.com, 
	mordechay.goodstein@intel.com, matti.gottlieb@intel.com, 
	rotem.saado@intel.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 1, 2022 at 4:38 PM Tom Rix <trix@redhat.com> wrote:
>
> Clang static analysis reports this representative issue
> dbg.c:1455:6: warning: Branch condition evaluates to
> a garbage value
>   if (!rxf_data.size)
>        ^~~~~~~~~~~~~~
>
> This check depends on iwl_ini_get_rxf_data() to clear
> rxf_data but the function can return early without
> doing the clear.  So move the memset before the early
> return.
>
> Fixes: cc9b6012d34b ("iwlwifi: yoyo: use hweight_long instead of bit manipulating")
> Signed-off-by: Tom Rix <trix@redhat.com>

Conditional initialization in a helper is a pretty dangerous pattern.
How about we move the memset to the two callers of
iwl_ini_get_rxf_data?

> ---
>  drivers/net/wireless/intel/iwlwifi/fw/dbg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/intel/iwlwifi/fw/dbg.c b/drivers/net/wireless/intel/iwlwifi/fw/dbg.c
> index abf49022edbe..666de922af61 100644
> --- a/drivers/net/wireless/intel/iwlwifi/fw/dbg.c
> +++ b/drivers/net/wireless/intel/iwlwifi/fw/dbg.c
> @@ -1388,13 +1388,13 @@ static void iwl_ini_get_rxf_data(struct iwl_fw_runtime *fwrt,
>         if (!data)
>                 return;
>
> +       memset(data, 0, sizeof(*data));
> +
>         /* make sure only one bit is set in only one fid */
>         if (WARN_ONCE(hweight_long(fid1) + hweight_long(fid2) != 1,
>                       "fid1=%x, fid2=%x\n", fid1, fid2))
>                 return;
>
> -       memset(data, 0, sizeof(*data));
> -
>         if (fid1) {
>                 fifo_idx = ffs(fid1) - 1;
>                 if (WARN_ONCE(fifo_idx >= MAX_NUM_LMAC, "fifo_idx=%d\n",
> --
> 2.27.0
>


-- 
Thanks,
~Nick Desaulniers
