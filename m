Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5074C408D4
	for <llvm@lists.linux.dev>; Fri,  9 Jun 2023 20:50:26 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-559409cc490so1457852eaf.3
        for <llvm@lists.linux.dev>; Fri, 09 Jun 2023 13:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686343825; x=1688935825;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=izWNb+6MP5eDvXpmmZ+4OuVugULQr70hbJDq79c8GxQ=;
        b=dhy0kPyXZ+AfkpXG3XFGam30GemwS8wBRmKYh4AC21vaij1Q180iPOnjWCVC+IbyRB
         34sC2Vrif/o2QhdRhWRKQ7ck762pqzaUwGf8Tcd6KvwXApl5K/6Bmq5jJ2j0ET5PqiKq
         CFWAJnjP+kUDI2IgAlyQxDwkWk6JaDFfqq8uuAcNYZ7Syi46Ddv1KPAjjCsZh7oj1moH
         b4LWp8DD/LZjcy/Gc5OHB1jSrugEWXBU+FpQTKIv2rLgAHmAgzCgSeUyE+Y5cUbp49+c
         1y6n8n2zCnupQmgbM8ROVr0HPOKnUfhaCSAaccdp+eOXd/GRGEB5eyv8Roiv9DwK19SB
         Vw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686343825; x=1688935825;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=izWNb+6MP5eDvXpmmZ+4OuVugULQr70hbJDq79c8GxQ=;
        b=ko/h1806NW39XHNXEzOVlNwlTIf6QTkeCgCJgTMat+ix9VGcHczjw7a6JHnIGuUYqg
         GI0aUY390IOKulhRdqF9dtU+FCge6kUlnfl0q1o/5TmYHR6wCcqVtnicgj+MfCQKmOfJ
         eCVp9b2tG2pXyCnBwXTmdDMhwXVbb7Gzltz2A8HKlxHucpxuSo33GzTosq+Le3a70MWv
         bwy605CLkg16SCZogdf/eZnFeNJ/GsUUvuKdezOZtTy6yBuQdVfMCVAZ1EDMjmyp6dy9
         HXn3J6XDVVOjcptqa2aCalB63zrT2LxrdlI+YI4VdNI80vzkNlPfkPfBGvTl+YfWDKTP
         iB3g==
X-Gm-Message-State: AC+VfDxVoIF90WA8xkhV07f5qUzFXX+AZ/HMBNAKYcY2+Fms7Jf18wdv
	DwmLdb48gEpG3xG8D3QlzO5wUFL7TDFm5EWH3YrxOekSE9RmPm/at94Bkg==
X-Google-Smtp-Source: ACHHUZ79aq2sxiisEfauqcQBGDDi62j/FO370J9EeQLOVIT6GXGImVhWzLA8n8VCYaOwS6/pmn3+WwBr+2EpHu+fT4g=
X-Received: by 2002:a05:6359:323:b0:123:4ea9:9fe9 with SMTP id
 ef35-20020a056359032300b001234ea99fe9mr2143900rwb.3.1686343824843; Fri, 09
 Jun 2023 13:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 9 Jun 2023 13:50:13 -0700
Message-ID: <CAKwvOd=qxNfPDo-=bxzyzmY3YmsBtxv686rr9Q_thrfC6ni3eg@mail.gmail.com>
Subject: kernelci: please upgrade clang-17
To: kernelci@lists.linux.dev
Cc: clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Starting a new thread because gmail cannot handle replying to an email
w/ >45k warnings.
https://lore.kernel.org/llvm/6482b7dd.170a0220.a93c3.9102@mx.google.com/

instances of -Wbuiltin-macro-redefined have been fixed in ToT llvm.
Updating clang-17 should resolve most of the error spew.

Does kernel CI update ToT clang builds on a fixed cadence?

Thanks for the tests and reports; we still read them daily.
-- 
Thanks,
~Nick Desaulniers
