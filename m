Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966F71879
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 14:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04759C433CB
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686926406;
	bh=LmQ0A+9O9O846YKQ9SkKO3tmg56GUE4m1YrLD2TzUKQ=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=EvENScLdZ2899SCUlEib3TpooSqIrCtaEXZzsD1BE1WIVTLGsud+qlbOU2R/70Chw
	 bVtUjCBmb7msknzEaW5MevV/CFQBx0qFRiOjHZ7CLLp6nRCMzbAkHeuh6tz3C2YY2x
	 gIPd8Ozt7OMBe8OvEmFvRWqIo8oO+gSq03PszmfHZhd30q64iQBjFNq2/q+OytalAv
	 89Yj9aC0EDcLz2ksTAkRNCavGQCS4CT6Zn+JEC2/FeT7DRLqhsDxjePTfnOboQJCY4
	 FL153lVpC1R36Ndn/6pkh46PQAEh9VehBT00JaOqO+u50SDTRyCIZaq2RfKwpp7kQC
	 6T4vx1n6+9VDg==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-55b85b94bb0so478676eaf.0
        for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 07:40:05 -0700 (PDT)
X-Gm-Message-State: AC+VfDyETtW9VEVbko2edYYQ3FL9NY2Ol9P4Y7mOxKJqq3EPNRVPVfZb
	74q4nAoiyrl+lcncEZxYPbhf6YK6mgYad03vm3c=
X-Google-Smtp-Source: ACHHUZ6z8GA1qZV8cYgrktvFU8j0O2B9+u9zyzznMrSz3BZZRqGJ81uDTG5XgaLcvQipbezYj8K+9eZ0Q4y7eufjbkk=
X-Received: by 2002:a4a:d786:0:b0:558:bb12:da9f with SMTP id
 c6-20020a4ad786000000b00558bb12da9fmr1811379oou.2.1686926405144; Fri, 16 Jun
 2023 07:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a8a:7cb:0:b0:4df:6fd3:a469 with HTTP; Fri, 16 Jun 2023
 07:40:04 -0700 (PDT)
In-Reply-To: <20230616090749.2646749-1-arnd@kernel.org>
References: <20230616090749.2646749-1-arnd@kernel.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 16 Jun 2023 23:40:04 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-j6mJ91hZUZi86HnGJahekHHgYz4ngWfF81QmYigGqVw@mail.gmail.com>
Message-ID: <CAKYAXd-j6mJ91hZUZi86HnGJahekHHgYz4ngWfF81QmYigGqVw@mail.gmail.com>
Subject: Re: [PATCH] smb: avoid field overflow warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: Steve French <sfrench@samba.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Dave Chinner <dchinner@redhat.com>, 
	Kees Cook <keescook@chromium.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Ronnie Sahlberg <lsahlber@redhat.com>, Hyunchul Lee <hyc.lee@gmail.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

2023-06-16 18:07 GMT+09:00, Arnd Bergmann <arnd@kernel.org>:
> From: Arnd Bergmann <arnd@arndb.de>
Hi Arnd,

>
> clang warns about a possible field overflow in a memcpy:
>
> In file included from fs/smb/server/smb_common.c:7:
> include/linux/fortify-string.h:583:4: error: call to
> '__write_overflow_field' declared with 'warning' attribute: detected write
> beyond size of field (1st parameter); maybe use struct_group()?
> [-Werror,-Wattribute-warning]
>                         __write_overflow_field(p_size_field, size);
>
> It appears to interpret the "&out[baselen + 4]" as referring to a single
> byte of the character array, while the equivalen "out + baselen + 4" is
> seen as an offset into the array.
>
> I don't see that kind of warning elsewhere, so just go with the simple
> rework.
>
> Fixes: e2f34481b24db ("cifsd: add server-side procedures for SMB3")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  fs/smb/server/smb_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/server/smb_common.c b/fs/smb/server/smb_common.c
> index a7e81067bc991..e3273fa640b07 100644
> --- a/fs/smb/server/smb_common.c
> +++ b/fs/smb/server/smb_common.c
> @@ -536,7 +536,7 @@ int ksmbd_extract_shortname(struct ksmbd_conn *conn,
> const char *longname,
>  	out[baselen + 3] = PERIOD;
>
>  	if (dot_present)
> -		memcpy(&out[baselen + 4], extension, 4);
> +		memcpy(out + baselen + 4, extension, 1);
Is there any reason to change copy bytes from 4 bytes to 1 byte?

Thanks!
>  	else
>  		out[baselen + 4] = '\0';
>  	smbConvertToUTF16((__le16 *)shortname, out, PATH_MAX,
> --
> 2.39.2
>
>
