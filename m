Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1258AE574
	for <llvm@lists.linux.dev>; Mon, 21 Aug 2023 18:26:36 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-649a653479bso18837416d6.0
        for <llvm@lists.linux.dev>; Mon, 21 Aug 2023 11:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692642396; x=1693247196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/YqDlNw5F1+rz9QXavoHkrghYGlNNsfuAy+jwFR/+c=;
        b=Cn+E3s9l83bpTkhkBFoDwWI1REgs//74bQ30HcY1zP2uPoC2+vqvnDzu2LrQKdyczK
         8Ug7uh64s/ghAlPfCHxqZxrkpjNGn9J5nygKGsM7LZRDsd7m/6+eP70u2yAPthIYjFW8
         0Hdid6xF0CrdZUwrEWItO/2JnDZ39zq0vCYLWgCBN4OA3Pa6oVJ9UB3T7hpBgj+2ClEB
         PU9RsebMdfIKugiHBGt10o61MPJRQJ9H4gvHmCfOAaD2myHdytV02AGjM4sXFV1dfNEc
         tD21GLGFAljhm80XJPOq2xAQdCKhhpBwg849VbGFBTUJXI2iiylrUyt7R0UkBTVI3wd+
         P8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692642396; x=1693247196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/YqDlNw5F1+rz9QXavoHkrghYGlNNsfuAy+jwFR/+c=;
        b=jyriBWBwTxUq96ZXnvV5dpsEWOA9ekyctcJfypGZ2uGtLCcYujgLDfQr92NuR4TdKr
         1h9PmotZCsWLBobZqwYOvFtB6ug7ntN04MV2waQKjgd4QVRiYwCl7OE69RSCee+sZzqi
         FQnPUxRVB2UyDLEp1J3Ss1NynoPQdHKBJX93Gi8NaueyxK9+LraWu/awsL6MD2ayihLi
         nUuYtn5GnrINf611UZPU7mJs/u2ShPpiDJ4BSc/91PVC0QepbVJO9UMdPbuEJg+22Kkh
         MqxR8pUBk1xesgVVAn4+rN4mAWnE8k4qOFIfRTSS08PSrEr8eiVqSiUzqOywOE/sngTt
         oTZA==
X-Gm-Message-State: AOJu0Yyd0g4gYFo0kpWsH32w44IJuHstum4/2alZCR6xSAXh7y8sq84j
	v2QKgGSvcSUlyP1g9T403WLMdpcqiMZK9ZMUQPoTPCnwfpNKW3oywhpVeQ==
X-Google-Smtp-Source: AGHT+IHXtZwGvbFEutjrNJHqOIEErZqxeqIeGAh97FrMelK9DNT79hfeLwYEmYOGkf7p3JeTnORDflFl0PbPdil/8mI=
X-Received: by 2002:a05:6214:513:b0:647:1ff2:b2f3 with SMTP id
 px19-20020a056214051300b006471ff2b2f3mr6096818qvb.62.1692642395713; Mon, 21
 Aug 2023 11:26:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230811140327.3754597-1-arnd@kernel.org> <20230811140327.3754597-6-arnd@kernel.org>
 <CAK7LNASuTOwHA0zz8MqxPdt5snMstpSY7==0o6kmU-RML3nioQ@mail.gmail.com>
In-Reply-To: <CAK7LNASuTOwHA0zz8MqxPdt5snMstpSY7==0o6kmU-RML3nioQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 21 Aug 2023 11:26:24 -0700
Message-ID: <CAKwvOd=7HedYtAN3fTdTwxQbS7eYPxsxuX9wxxvNQ0BRFG0AbQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] extrawarn: enable format and stringop overflow
 warnings in W=1
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-kbuild@vger.kernel.org, 
	linux-arch@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 12, 2023 at 6:11=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> These are redundant because -Wall implies
> -Wformat-overflow and -Wformat-truncation
> according to the GCC manual.

To triple check this grouping behavior in clang, there's a utility
called `diagtool`.

$ diagtool tree

will print the hierarchy of diagnostics and color code them to explain
whether they're on/off by default or not-implemented-but-recognized.

For the above two -Wformat-* warnings, note that clang does not yet
implement those.  I've filed
https://github.com/llvm/llvm-project/issues/64871 to track that.
--=20
Thanks,
~Nick Desaulniers
