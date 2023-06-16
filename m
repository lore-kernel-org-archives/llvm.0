Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0BE3D62
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 14:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B49AC433CB
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 14:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686926967;
	bh=PpvVp7yyDQOIU09JMBq0XFKGWFo4ig5UBnsewUfXeNA=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=GPnzL50RS1+D0LSYwSZZG4pgHNaZOWDRhOWPLxC2v+obTqMbZDRlNYd6mRZUh95lw
	 /MViQ2NXSjOIoqNgFX0d4vdNGJ6QExTbvzdxcrFM3CfUOcKzVq2zRGCYIJKwQnugdR
	 ps5U8Q32qCPaCP4muIPy7aSv7Zz1zQAfcTYC5f3n2Dy3e7HFn9aPYnITYxQOfcdPUF
	 QxKbcUrNysLFA+NmgGdxKT6DRj7oDNE/+YYkdoW+iGMYX8yC8YWTlMmGKEeal3sKSE
	 AvNtRQdKdXZ4w8l3l5/9qMTv4bsBvRc2+gKw55M9TJ2DNVJg21vxUoncRyV50jaBJM
	 8WFlBglwuox4A==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1a2c9f087f0so921861fac.3
        for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 07:49:27 -0700 (PDT)
X-Gm-Message-State: AC+VfDwcVu5wqLBGN0ZFL3bfHpzFp6sRyPDi/mamAfOASl62+ueSfxWQ
	z2OZKWso5qowIZOICDT9S2GrOgoPzZuJkHkLr4s=
X-Google-Smtp-Source: ACHHUZ5Qh3zWWQYdcYt7lpa65mCYb8r6eF4mr0xQqer2K4/526o+mfkB5ppZcUdY6ITLJY5R4SshkagJHs6LG3DUhb4=
X-Received: by 2002:a05:6870:a2c4:b0:1a6:c968:4a15 with SMTP id
 w4-20020a056870a2c400b001a6c9684a15mr2132567oak.4.1686926966551; Fri, 16 Jun
 2023 07:49:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a8a:7cb:0:b0:4df:6fd3:a469 with HTTP; Fri, 16 Jun 2023
 07:49:26 -0700 (PDT)
In-Reply-To: <6742b2ce-02f1-43c1-811f-de7fd0a74f6a@app.fastmail.com>
References: <20230616090749.2646749-1-arnd@kernel.org> <CAKYAXd-j6mJ91hZUZi86HnGJahekHHgYz4ngWfF81QmYigGqVw@mail.gmail.com>
 <6742b2ce-02f1-43c1-811f-de7fd0a74f6a@app.fastmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 16 Jun 2023 23:49:26 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8v8CAccMb-2KM5P0yds_8wU-9k+n4QmatFe6Hwz1TYhw@mail.gmail.com>
Message-ID: <CAKYAXd8v8CAccMb-2KM5P0yds_8wU-9k+n4QmatFe6Hwz1TYhw@mail.gmail.com>
Subject: Re: [PATCH] smb: avoid field overflow warning
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Steve French <sfrench@samba.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Dave Chinner <dchinner@redhat.com>, 
	Kees Cook <keescook@chromium.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Ronnie Sahlberg <lsahlber@redhat.com>, Hyunchul Lee <hyc.lee@gmail.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

2023-06-16 23:42 GMT+09:00, Arnd Bergmann <arnd@arndb.de>:
> On Fri, Jun 16, 2023, at 16:40, Namjae Jeon wrote:
>> 2023-06-16 18:07 GMT+09:00, Arnd Bergmann <arnd@kernel.org>:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> clang warns about a possible field overflow in a memcpy:
>>>
>>> In file included from fs/smb/server/smb_common.c:7:
>>> include/linux/fortify-string.h:583:4: error: call to
>>> '__write_overflow_field' declared with 'warning' attribute: detected
>>> write
>>> beyond size of field (1st parameter); maybe use struct_group()?
>>> [-Werror,-Wattribute-warning]
>>>                         __write_overflow_field(p_size_field, size);
>>>
>>> It appears to interpret the "&out[baselen + 4]" as referring to a single
>>> byte of the character array, while the equivalen "out + baselen + 4" is
>>> seen as an offset into the array.
>>>
>>> I don't see that kind of warning elsewhere, so just go with the simple
>>> rework.
>>>
>>> Fixes: e2f34481b24db ("cifsd: add server-side procedures for SMB3")
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>> ---
>>>  fs/smb/server/smb_common.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/fs/smb/server/smb_common.c b/fs/smb/server/smb_common.c
>>> index a7e81067bc991..e3273fa640b07 100644
>>> --- a/fs/smb/server/smb_common.c
>>> +++ b/fs/smb/server/smb_common.c
>>> @@ -536,7 +536,7 @@ int ksmbd_extract_shortname(struct ksmbd_conn *conn,
>>> const char *longname,
>>>  	out[baselen + 3] = PERIOD;
>>>
>>>  	if (dot_present)
>>> -		memcpy(&out[baselen + 4], extension, 4);
>>> +		memcpy(out + baselen + 4, extension, 1);
>> Is there any reason to change copy bytes from 4 bytes to 1 byte?
>>
>
> No, that was an accident, this patch is wrong.
>
> I have to revisit this one and check if my change actually still works
> after I change it back to the correct length.
Okay:)
Thanks for your check!
>
>       Arnd
>
