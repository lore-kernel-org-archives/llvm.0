Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834293FCE
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 20:56:30 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id p15so1159024ejc.7
        for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 12:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kQGUfbOiSlrXMWUB18ru2iMPwWDRo+fWaUgVereZ2qk=;
        b=wLSlYUEyQWUG6vKfQCq9KI7LXIXNt34AGU/mX3JinGyH12FdYVo8kEIoeU60EXb2mZ
         MlkSLV03PttxOVmBXcXapCY45/8sfSGnRCQjsFMu2jR/es/RTBNUvz5qCi7OVf77WU+Y
         7TYrLd/2nXd2fdynCbmwqrkopOJ//NxOX8JquCNQTFVNCdcvrovlNahGrjOeJCnWVe8T
         ClW8pOYYtQoYXf0ySW5WvNAvhg5ri22vqrNO95dE5Gs7F5hkx3tqm+WgAToLfQzKE1dJ
         ysuu8e5xSzUKHCAkUkWox443UH/2Wm/qo5oSTcrFa5gLXa+XOi5duQcq4910WWaIEkD7
         WRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kQGUfbOiSlrXMWUB18ru2iMPwWDRo+fWaUgVereZ2qk=;
        b=hJOaE+0Che4GOZYFccPtSaPV0Y+UHa7Q7+YNTFd10rfaQCoyiU1yKBJ3uGCt3E/CtV
         /Ole1OZekZp3q26AfzihHge/A7NOIW3QwNmhPpC1gkjUo7n46sDUM3RraTG8O+VRveMy
         aOK1MnY75SF5DmLUEi3rOPDuqztZVCI50dDDuCCf6HTclzCyCjgMTP6MIfFLWtS6HyUL
         IkZZBQdJWwSg1iAiKeZHJZvPA22Wh9SZbmQqcf8f0mWI4gPUB2PPp2rr8vbceu5hxRMf
         PBhhT4aEFl7BsT2DJCBEY8OPuyRbZyjVI0MBv6mjuT1tzSO+tOd5lHtVMOLK6kbDDkys
         vWBQ==
X-Gm-Message-State: AOAM533TPBX05H5lNpfOCfl/96pV3ZV69Iljerz1+YKI2O/W+2JykIne
	zENYmo3FcJ3U0Q42KRGhGfP6tz/RsBF8wRYkw8jK
X-Google-Smtp-Source: ABdhPJyPolSj1HislWpwcc7wwWj76EMmcvl2tq9+mcpygxOEbytuu7jmEd/aqFx0WAIvqedUrEaqZY4du6iFu3T5ETM=
X-Received: by 2002:a17:907:3e8a:: with SMTP id hs10mr504091ejc.112.1643230588804;
 Wed, 26 Jan 2022 12:56:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125141422.32655-1-cgzones@googlemail.com> <20220125141422.32655-6-cgzones@googlemail.com>
In-Reply-To: <20220125141422.32655-6-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 26 Jan 2022 15:56:17 -0500
Message-ID: <CAHC9VhQP+xpEQCppx-Qvyd0hW9rcANfaw9F6972zo2PwCk_ZyQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] selinux: do not discard const qualifier in cast
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jeff Vander Stoep <jeffv@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 9:14 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> Do not discard the const qualifier on the cast from const void* to
> __be32*; the addressed value is not modified.
>
> Reported by clang [-Wcast-qual]
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/netnode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Merged, thanks.

--=20
paul-moore.com
