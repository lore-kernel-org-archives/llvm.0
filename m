Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A163D38B
	for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oYFSTRpd"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32daeed7771so3153713f8f.3
        for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 09:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697647138; x=1698251938; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9SF8JJcd8ct9ipQtfiI/7at0EuX7KbDRsL4NAWMQ7k=;
        b=oYFSTRpdwjo+GjigoQk1lmEwlUhbnj48URshK2n/NFATOrQSCeymhGf6kI9HahdCtW
         bbUrzq5qd0BRLNhmFEkueAIPgzD2kRp8SAvT2YglyC53sDk3rXto1Z9wZw5hvP8Dzn0Y
         8fisuHQBoRLdVjYAqawvuQn/kVmhSKEDV+EKoSabwCHOka5uBTIpU6zyRTMzDyJfHRAQ
         kgk8lC06HJcT9oE4wC+n6t5s+FV6bIGMHwROWSJOVXNN7xOWO9CaKNm9Jb5WYgZWnnw9
         SJm0v96t2gIDvUaLdFaxg9egR5GNsd7V+C2x90mM7JNK2HUpOxvrTw6zbiBld1KfTUQj
         SfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697647138; x=1698251938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9SF8JJcd8ct9ipQtfiI/7at0EuX7KbDRsL4NAWMQ7k=;
        b=RkdqT8DKzN0EUtRsGLr2xr9qVjDaUxkdGT+SJHelo4P+uyNLRtQOT9lsXnpf5P1lck
         CXp3H+3fUqSmsK28/aYpBv3M1DHuNa5h4qBT2UHkEC7a1xDxVlcI3leKjmC6a66Me49H
         FJ7KCPwqP4YCvWfCER8ce8RRbHP9kPFN1s8/04MSZzHiqyKjmAFLHImrW/+k4cCZpB9b
         vORgfzrViYtEufm3PvyMBTphcbh4cAGWElFCbIJXjg1vkeRyeJGTkkLsSjAAVLJLQdKM
         NdbmUp0XPV9e44Yji68WCnaRTJqLf5YXmEB6wF6rTNkn6abfZTTNDVJ7jUxi06IEL4Hz
         4ZPw==
X-Gm-Message-State: AOJu0YyA/qCeQehY1GburLzVKuNakc3MOAJw2VlCQfEpEIPZ3c7p3WYx
	ngzGzJu3hKhpY5/Te382OVIsqBNSr6PYKbvXZ7WO3Q==
X-Google-Smtp-Source: AGHT+IEakwXt8NBnPKYnazuwZ478k495vdqLMc2ZTG6OjrZ/HclMdIwXVZ2e99aU9P5tfmuqpDkaw/ASeyEtGaCMveM=
X-Received: by 2002:a5d:4ec5:0:b0:32d:8cd1:52e4 with SMTP id
 s5-20020a5d4ec5000000b0032d8cd152e4mr4431912wrv.6.1697647138401; Wed, 18 Oct
 2023 09:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231018153147.167393-1-hamza.mahfooz@amd.com> <CANpmjNPZ0Eii3ZTrVqEL2Ez0Jv23y-emLBCLSZ==xmH--4E65g@mail.gmail.com>
In-Reply-To: <CANpmjNPZ0Eii3ZTrVqEL2Ez0Jv23y-emLBCLSZ==xmH--4E65g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 Oct 2023 09:38:43 -0700
Message-ID: <CAKwvOdkB8EDpbHjkL=u-5_ri6c+y6EMDx2sET+EEANXoSeDDSQ@mail.gmail.com>
Subject: Re: [PATCH] lib: Kconfig: disable dynamic sanitizers for test builds
To: Marco Elver <elver@google.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org, 
	Rodrigo Siqueira <rodrigo.siqueira@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 9:22=E2=80=AFAM Marco Elver <elver@google.com> wrot=
e:
>
> That being said, we're aware of KASAN having had more issues and there
> are some suboptions that have been disabled because of that (like
> KASAN_STACK). I'm not sure if Clang's KASAN instrumentation has had
> some recent improvements (we did investigate it, but I can't recall
> what the outcome was [1]) - maybe try a more recent compiler? However,
> KCSAN and KMSAN shouldn't have any issues (if KMSAN is enabled,
> FRAME_WARN is 0). And having build tests with them enabled isn't
> useless at all: we're making sure that these tools (even though only
> for debugging), still work. We _want_ them to work during random build
> testing!
>
> Please share the concrete problem you're having, because this change
> will make things worse for everyone in the long run.
>
> [1] https://github.com/llvm/llvm-project/issues/38157

Some recent issues I discovered in clang that exacerbate stack usage
in general, which is then amplified by KASAN:
1. https://github.com/llvm/llvm-project/issues/68746
2. https://github.com/llvm/llvm-project/issues/68747
Those are next up on my to fix list after what I'm working on now.  I
suspect that those aren't the last issues now that I've found a thread
to pull on.

--=20
Thanks,
~Nick Desaulniers
