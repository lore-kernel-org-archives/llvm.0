Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C533E28917
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 06:42:37 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5007abb15e9so863280e87.0
        for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 23:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692945755; x=1693550555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw/TPy5PPNB4EMsxpIFEVOsKZ2VJzxUxBznQoDOdffI=;
        b=UpxJmUF5ambajGRTOkN70yPHL9WD3P4M00wxtszch4r34Y3zKyy3MNF19DHwqfQgU9
         TXYXZP3K7RtbK4KFKv8BQS0u6JO3qLOS216LBWWumkrYfk71SUfTKETOMXMj/zINbqWX
         vEgDNbqMMHcdcTCYLgjAmu73yBeTjdlxK+kf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692945755; x=1693550555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fw/TPy5PPNB4EMsxpIFEVOsKZ2VJzxUxBznQoDOdffI=;
        b=eYJ5W3PRTruSuqtV7pcHfZxHS0iIxpMhSkhJ24SeNUsiLghzO+4r7543s063VPlTlM
         RBBpDhMqfiHN7vTVHhDH7z9uncFmeSGp16zOz5ilZIUaMMMIsnApLcPmUjhRghwsYOtS
         a6x2n1koBsvKasSJr1zpOVmZcmShXwI29SmbgYtaOCA1We+vCsckIg55f8dOllYQ3v9S
         4ITMLFBTLzgX4Eq7se8oQrmgzvqN9BDvideiHtjfPtvX7HM3hgIwWrZsru9AoKShIUkA
         IjSp7ST4edCeNZODgoNl9TbOTgkmXIDM2hXU1v2HjA6Wz3ZCg6gbtWY5gMHdmFC4czAB
         w5mg==
X-Gm-Message-State: AOJu0YzONd00onJ8OD4SRNkdAshHFTPCThftZ7CA8DpflQDKIKVJt2Tt
	KkSPLbroZ7HDhpdoYG4o9W1drRf9EKikvfxCatVUkw==
X-Google-Smtp-Source: AGHT+IG6FUhjuS7jGvtYJp+Y5GnZ7JsUtK1au0ormYeBwz788UQ8ga8VspmYencK/Tf/1SwCV45MsdoGiS/GWSizaYU=
X-Received: by 2002:ac2:4c52:0:b0:4fe:7e1f:766a with SMTP id
 o18-20020ac24c52000000b004fe7e1f766amr17087918lfk.24.1692945755226; Thu, 24
 Aug 2023 23:42:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org> <20230822174835.253469-1-denik@chromium.org>
 <CAFP8O3KunP9CzT_U2cj1_oysojTxCNJRWX_kvvu_wOx4tbYHug@mail.gmail.com>
 <CAK7LNASstNj2HEfJHcRzqt7hay65T-yEgzaAuXbEQPuCS+yC6w@mail.gmail.com>
 <CADDJ8CWdm+cWt4UBTae0sCQ8ZDWhbMuozqqq59R+EtvMHere0g@mail.gmail.com>
 <CAFP8O3+3++awDi9uZueFC_xi+KAud0Ds3k3vdd_ruVngOEOKiw@mail.gmail.com> <CAK7LNAQcUkr8Phtj_cv6vD-QUvjO+7LEsQ5Tx+AuPAB1rbTU9w@mail.gmail.com>
In-Reply-To: <CAK7LNAQcUkr8Phtj_cv6vD-QUvjO+7LEsQ5Tx+AuPAB1rbTU9w@mail.gmail.com>
From: Denis Nikitin <denik@chromium.org>
Date: Thu, 24 Aug 2023 23:42:23 -0700
Message-ID: <CADDJ8CUfOqKJpoiDurdbm6suZmqmn5qL6EwE_6xXhxh5pdy3Uw@mail.gmail.com>
Subject: Re: [PATCH v2] modpost: Skip .llvm.call-graph-profile section check
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Fangrui Song <maskray@google.com>, linux-kbuild@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"

>
> Thanks, Fangrui.
>
>
> I'd like the commit log to record the use of REL for
> .llvm.call-graph-profile is intentional.
>
>
> Denis, could you add some more comments?
>

Sure, I will send a new version.

Thanks,
Denis

>
>
> --
> Best Regards
> Masahiro Yamada
