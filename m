Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE9EA921
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 16:27:48 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id j17so19323938lfr.3
        for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 08:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=24b794oj7rHXD9kyGoCrHN+Vr9labBoVEJJqpRMaDe4=;
        b=YNVqHnxtOzQXgjbziYxPO8GNC7zCx3fYhOSnkxKEkOXp1MfydHcJtE8amfV4sYE+I0
         NcRsUKYzPLBlNrXccUbhCUhhtctYtGRko2Z4YwCqJM5WLEveWWedg15VOVBWF7ZsLRqj
         6n7GYYKK5lEelGx+dqR8nzmW6MpOtue07HicKDX25nB/Pv24Aq6qE/Rd+ttnM0oaNpYR
         Cr3OULPpuXwj3NW/ckiNNvY04oeCPndIgrR6Se/JV+z8naSMxQjCAc7FhAcsYqASjVks
         Zp1U4Sd6EDVF4StNiAregq+zcabhcsezlIhO3Ry8twGUCTStdahNTKgiaSJhoAQoV6c5
         ZOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24b794oj7rHXD9kyGoCrHN+Vr9labBoVEJJqpRMaDe4=;
        b=4YfoNkLNjK+Uw3MdkqW1ue2jcHwk/auaSiYhr155YM2CET2IqJ6UlKr+DQKZ6XibP5
         sXowAMk+X2c3KjjWxEcQZEu2D3Y0qGYcOkZyAZKup2jMQeq2D5vGVnY/xbzszNGcDixZ
         noo8MDAarabfa7xX4bMd+LwulChvwYleOLmKgms9z/WVSfXORLmBP+Nntw7khZHXMpTM
         1NT8FF0cy7oLoDmBsv8yAWrNgCfUnwyqplY3ixRpEVNBNXSmA+ZS/2NgQCUJ5PxyXeh8
         3n1tK0w12pZYV4MF4w5LWKXLKpppVgG9bqwE4ICGs6CI5eTY553s97owdab0j/LksGSY
         otOw==
X-Gm-Message-State: AFqh2krmOlw+eISMTCU2yHQekdsxshblqHMlxuL34o4irq8An09mGjE2
	7h1diKNNJcZhH1tEG5RnaqMQwqoebTnsyMxCdR6KTg==
X-Google-Smtp-Source: AMrXdXt9wWOWy5EEMwM3AwaHi7iIfQmcidQBM/gYmtegbnbkafoWpleRQ0oZbfHkxxzlcOiEEcsllu7h8Id6At6K9HY=
X-Received: by 2002:ac2:4d90:0:b0:4b5:91c1:6f1f with SMTP id
 g16-20020ac24d90000000b004b591c16f1fmr7018844lfe.291.1673368066228; Tue, 10
 Jan 2023 08:27:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230110161831.2625821-1-trix@redhat.com>
In-Reply-To: <20230110161831.2625821-1-trix@redhat.com>
From: Peter Gonda <pgonda@google.com>
Date: Tue, 10 Jan 2023 09:27:34 -0700
Message-ID: <CAMkAt6oqBH35=moST5nO_BXwc8k0M4h_8TvT9H6outR9vOw5qg@mail.gmail.com>
Subject: Re: [PATCH] crypto: initialize error
To: Tom Rix <trix@redhat.com>
Cc: brijesh.singh@amd.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, nathan@kernel.org, 
	ndesaulniers@google.com, rientjes@google.com, marcorr@google.com, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 10, 2023 at 9:18 AM Tom Rix <trix@redhat.com> wrote:
>
> clang static analysis reports this problem
> drivers/crypto/ccp/sev-dev.c:1347:3: warning: 3rd function call
>   argument is an uninitialized value [core.CallAndMessage]
>     dev_err(sev->dev, "SEV: failed to INIT error %#x, rc %d\n",
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> __sev_platform_init_locked() can return without setting the
> error parameter, causing the dev_err() to report a gargage

garbage

> value.
>
> Fixes: 3d725965f836 ("crypto: ccp - Add SEV_INIT_EX support")

Should this be: 'Fixes: 200664d5237f ("crypto: ccp: Add Secure
Encrypted Virtualization (SEV) command support")'

Since in that patch an uninitialized error can be printed?

+void psp_pci_init(void)
+{
+       struct sev_user_data_status *status;
+       struct sp_device *sp;
+       int error, rc;
+
+       sp = sp_get_psp_master_device();
+       if (!sp)
+               return;
+
+       psp_master = sp->psp_data;
+
+       /* Initialize the platform */
+       rc = sev_platform_init(&error);
+       if (rc) {
+               dev_err(sp->dev, "SEV: failed to INIT error %#x\n", error);
+               goto err;
+       }


...

+static int __sev_platform_init_locked(int *error)
+{
+       struct psp_device *psp = psp_master;
+       int rc = 0;
+
+       if (!psp)
+               return -ENODEV;
+
+       if (psp->sev_state == SEV_STATE_INIT)
+               return 0;


So if !psp an uninitialized error is printed?

> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/crypto/ccp/sev-dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
> index 56998bc579d6..643cccc06a0b 100644
> --- a/drivers/crypto/ccp/sev-dev.c
> +++ b/drivers/crypto/ccp/sev-dev.c
> @@ -1307,7 +1307,7 @@ EXPORT_SYMBOL_GPL(sev_issue_cmd_external_user);
>  void sev_pci_init(void)
>  {
>         struct sev_device *sev = psp_master->sev_data;
> -       int error, rc;
> +       int error = 0, rc;
>
>         if (!sev)
>                 return;
> --
> 2.27.0
>
