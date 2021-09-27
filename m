Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1093872
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 10:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632737376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WgO9Fjl4OcAgYGVjtzMRiOwa5eVYSll8vIeR9E0XZlo=;
	b=gPzfJWpsYqMhyqYRkzEpmb28CMfrWxFfSmteboZEBWouAMcT3FZgjhfVxkvEN6ieJCYwHQ
	LG35dpaMcTP0LkzjJsX7edeEWwrFJI00VY1vWjrhhPv1V+31+lnAn4vRgwSvPzdVQ34wKh
	qkyKnDfYSP0bgQqTL/sZPoFrlZTjLDg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-BKfHFfbHOli03aovs7VjZQ-1; Mon, 27 Sep 2021 06:09:03 -0400
X-MC-Unique: BKfHFfbHOli03aovs7VjZQ-1
Received: by mail-ed1-f70.google.com with SMTP id l29-20020a50d6dd000000b003d80214566cso17077104edj.21
        for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 03:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WgO9Fjl4OcAgYGVjtzMRiOwa5eVYSll8vIeR9E0XZlo=;
        b=tG0N/Jw0xQlzC3ocGOx1L2ZcfWyEO7+fUpyOYtEA5h4o1zQUgQrOztJPUb0KGG81Cr
         +1gLYaYAqy5mNWdVyaHrnf6/Zo9CWf/l2RePkIWabqpY3tqoTYz1YKcFXFoxiollhcKo
         VCejKTKVJH9Qf8Ee5Zy2GeVBALJ1vc9nIc8Tj5eK1zfbJEx8Wl8WfIAfNhxYKnoH4ayJ
         rXR35dOP8BnYNUt+ofSgNdvZ7hUMERDmEYnQR/gmi89OkBkaalvgJjHBRJo+NExl6Xpf
         XH3IEfCDjVyYhlUPN/afRJvBbQTdGzW/flrivi6nwvvPLSw88jJb0A4i1s60hYK56sE9
         MrTw==
X-Gm-Message-State: AOAM532XW/kkDSjRqdwmvEY9Dh7dgeRM3M7VK8yhHA7beHRx/WJVRZtf
	lNsDPLT2swvUL1zoaYPga54PaANgtplERjeg/h+kJiZyOYehfvq6E5bLE1NK23cjL3plIq4RD/a
	gEKm96WNNxEnn9HzvTN2YKb+UNYOO0sW1nXCfH2jQckWgleINpxY83LHpLGbVtPDLPg==
X-Received: by 2002:a17:906:fcad:: with SMTP id qw13mr25563731ejb.127.1632737342208;
        Mon, 27 Sep 2021 03:09:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8U1+f3TegbtJxSIAhpvPLVIJ5nh9xqDjUNY04ahqwTGF7oe5vjxEJRPoPXikOQjPjCLX3Ew==
X-Received: by 2002:a17:906:fcad:: with SMTP id qw13mr25563702ejb.127.1632737341905;
        Mon, 27 Sep 2021 03:09:01 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id p26sm4312438eds.58.2021.09.27.03.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 03:09:01 -0700 (PDT)
Subject: Re: [PATCH] vboxsf: fix old signature detection
To: Arnd Bergmann <arnd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20210927094123.576521-1-arnd@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <40217483-1b8d-28ec-bbfc-8f979773b166@redhat.com>
Date: Mon, 27 Sep 2021 12:09:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210927094123.576521-1-arnd@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 9/27/21 11:40 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The constant-out-of-range check in clang found an actual bug in
> vboxsf, which leads to the detection of old mount signatures always
> failing:
> 
> fs/vboxsf/super.c:394:21: error: result of comparison of constant -3 with expression of type 'unsigned char' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>                        options[3] == VBSF_MOUNT_SIGNATURE_BYTE_3) {
>                        ~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

This actually seems to be a clang bug though, or at least a weird
interpretation (and different from gcc) of the C spec.

VBSF_MOUNT_SIGNATURE_BYTE_3 is defined as:

#define VBSF_MOUNT_SIGNATURE_BYTE_3 ('\375')

The C-spec:

http://port70.net/~nsz/c/c11/n1570.html#6.4.4.4p5

Says the following:

"The octal digits that follow the backslash in an octal escape sequence are taken to be part of the construction of a single character for an integer character constant or of a single wide character for a wide character constant. The numerical value of the octal integer so formed specifies the value of the desired character or wide character."

Character constants have a type of int, so 0375
clearly fits in the range of that.

I guess the problem is that gcc sees this as

const int VBSF_MOUNT_SIGNATURE_BYTE_3 = 0375;

Where as clang sees this as:

const int VBSF_MOUNT_SIGNATURE_BYTE_3 = (char)0375;

Which is a nice subtle incompatibility between the 2 :|


With that said, the patch is fine and I have no objections
against it:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Although maybe it is better to actually remove any
ambiguity and just replace the defines with:

static const u8 VBSF_MOUNT_SIGNATURE_BYTE_0 = 0000;
static const u8 VBSF_MOUNT_SIGNATURE_BYTE_1 = 0377;
static const u8 VBSF_MOUNT_SIGNATURE_BYTE_2 = 0376;
static const u8 VBSF_MOUNT_SIGNATURE_BYTE_3 = 0375;

?

Regards,

Hans










> fs/vboxsf/super.c:393:21: error: result of comparison of constant -2 with expression of type 'unsigned char' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>                        options[2] == VBSF_MOUNT_SIGNATURE_BYTE_2 &&
>                        ~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
> fs/vboxsf/super.c:392:21: error: result of comparison of constant -1 with expression of type 'unsigned char' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>                        options[1] == VBSF_MOUNT_SIGNATURE_BYTE_1 &&
>                        ~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The problem is that the pointer is of type 'unsigned char' but the
> constant is a 'char'. My first idea was to change the type of the
> pointer to 'char *', but I noticed that this was the original code
> and it got changed after 'smatch' complained about this.
> 
> I don't know if there is a bug in smatch here, but it sounds to me
> that clang's warning is correct. Forcing the constants to an unsigned
> type should make the code behave consistently and avoid the warning
> on both.
> 
> Fixes: 9d682ea6bcc7 ("vboxsf: Fix the check for the old binary mount-arguments struct")
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  fs/vboxsf/super.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/vboxsf/super.c b/fs/vboxsf/super.c
> index 4f5e59f06284..84e2236021de 100644
> --- a/fs/vboxsf/super.c
> +++ b/fs/vboxsf/super.c
> @@ -21,10 +21,10 @@
>  
>  #define VBOXSF_SUPER_MAGIC 0x786f4256 /* 'VBox' little endian */
>  
> -#define VBSF_MOUNT_SIGNATURE_BYTE_0 ('\000')
> -#define VBSF_MOUNT_SIGNATURE_BYTE_1 ('\377')
> -#define VBSF_MOUNT_SIGNATURE_BYTE_2 ('\376')
> -#define VBSF_MOUNT_SIGNATURE_BYTE_3 ('\375')
> +#define VBSF_MOUNT_SIGNATURE_BYTE_0 (u8)('\000')
> +#define VBSF_MOUNT_SIGNATURE_BYTE_1 (u8)('\377')
> +#define VBSF_MOUNT_SIGNATURE_BYTE_2 (u8)('\376')
> +#define VBSF_MOUNT_SIGNATURE_BYTE_3 (u8)('\375')
>  
>  static int follow_symlinks;
>  module_param(follow_symlinks, int, 0444);
> 

