Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584BA4420
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 17:54:48 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id o7so9947810lfq.9
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 10:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e742o5/DR73yTXNsRkWlQk8w2u7Ql2wBnJE9VX+0HFA=;
        b=cpKaJMldA3QAFd+X6Huh0008adTUbdCqS6c21N9YjK7rxCrPixaWsbKkN7jqSjA3LL
         n1avF4Oymvl8YCaxfO6AXWnHkishlyVWDsfcAAsyWyxSwPf/X+B/1FAIBpV//dxSyJLI
         28oMEb7Jd/0UDFmnPLQzD2pFr40gkjrIXlaJSf7HuMwQF5G/HgK6hUUrZyPUMfBWXMuU
         jxXlk5wI8EG9NW/YeLFq33FDLprb5OPKOInPGju8bZ30T/9QLytxW86RHpF0aDYqOy4J
         sr153cvuc2MhO3DS4RNUS6MJ7u5MEkELMLsQIhCwUY25u1f7HDm38HEyRKH8cqcD/d75
         Zwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e742o5/DR73yTXNsRkWlQk8w2u7Ql2wBnJE9VX+0HFA=;
        b=UATN7vhkqS3wiYUsI8JeKo/WxpBse2Ftp3DgUbYVoC597cHFO01lxBBZ9NYkMxJAez
         QPKhdBjBb4zmv3oOoFWeSL86tXbTCWMG5jfa0dgA5mz2oxvWE7RpBfPHJnz1FEEuKI6n
         dwrnat82WwB4M54FOtXzNy4hqj3HI8bOOChKNzOquecJ4+67AMhNkO4mEMAh74ytcmFV
         vLulUyLXeTo7xedSl6LQAi3Hrc4DcKHOzuOmvox9cGMo5mH0NdCHwNHbA2NlJ6o5C79s
         yk3HgW+VINf1AnXTtD7HRCvznfWZabPaY3FZW4LS7C697R57VqFNdqb/6ObdUB+Lgi1h
         QObg==
X-Gm-Message-State: AJIora+NQ5pkF3vCpxze/YnMn/F06QFEv2WRbR1xFwdCAV3pAK9RPuGY
	gQaWJ4r6lu0XDEuGi127Np7/6mVU3FzE0upgaWGB/A==
X-Google-Smtp-Source: AGRyM1v6W1JtvClDboWp1bXgj125zWsg+8q03wEdEYCkwNBPeiosqpMEP/WFoPexCCOd/Sc+I59CwtAXSl4aaS3/g9w=
X-Received: by 2002:a05:6512:2623:b0:47d:ace7:c804 with SMTP id
 bt35-20020a056512262300b0047dace7c804mr12480814lfb.647.1657562086163; Mon, 11
 Jul 2022 10:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1657492202-18435-mlmmj-51d729a7@lists.linux.dev> <CAFP8O3+Lw0wKfWY-VA+tuAnVcjyN17E=yk6-VU5WcWG1xdH+UA@mail.gmail.com>
In-Reply-To: <CAFP8O3+Lw0wKfWY-VA+tuAnVcjyN17E=yk6-VU5WcWG1xdH+UA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Jul 2022 10:54:34 -0700
Message-ID: <CAKwvOd=u=77MQwFeyaBbc2T0JXSESKRDNrFtiaTTuRcm6K1BPg@mail.gmail.com>
Subject: Fwd: Bouncing messages from llvm@lists.linux.dev
To: postmaster@kernel.org
Cc: clang-built-linux <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Post Master,
Any idea what's up with the below message?

To Fangrui, it sounded like his patch wasn't delivered to our list but
the message Fangrui sent was indeed posted.
https://lore.kernel.org/llvm/20220710071117.446112-1-maskray@google.com/

Can the error be reworded possibly to elucidate what's going on?

---------- Forwarded message ---------
From: Fangrui Song <maskray@google.com>
Date: Mon, Jul 11, 2022 at 10:36 AM
Subject: Fwd: Bouncing messages from llvm@lists.linux.dev
To: Nick Desaulniers <ndesaulniers@google.com>


---------- Forwarded message ---------
From: <llvm+owner@lists.linux.dev>
Date: Sun, Jul 10, 2022 at 3:30 PM
Subject: Bouncing messages from llvm@lists.linux.dev
To: <maskray@google.com>


Greetings!

This is the mlmmj program managing the <llvm@lists.linux.dev> mailing list.

Some messages to you could not be delivered. If you're seeing this
message it means things are back to normal, and it's merely for your
information.

Here is the list of the bounced messages:
- 11406




--
=E5=AE=8B=E6=96=B9=E7=9D=BF


--=20
Thanks,
~Nick Desaulniers
