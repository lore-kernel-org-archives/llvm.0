Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A450F26E3C
	for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 22:19:57 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53074ee0c2aso2542a12.1
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 15:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694729995; x=1695334795; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dMsxVuhdFp5zH/Rhe12VoLyskw7df4SEAa1A1x2XSqM=;
        b=m8vtnbT9VrTfG0EBwtaZ7+kIB5C/KyGHAbzElOcjs6QEnwibSvRD1BzSL/bTEuwF0E
         9P4ztdpx4LBVc6qcvxRU1GmX7mxIkZ7fTL7xu++NmV0IRp1WDHzqVf3+7gFoS6YPwLRx
         jJm0Fr4Jxi/+EfDWHnpLMK0QdTFy8dZBQL2kmkKQJl1PTMv/fSLsII1MueYRv+GpE2oo
         klp3TFzfHor3n2STlsXSfNq3ym34U6ofWRl6fCJcQjII777CKFsNLE8TTjihebuBGild
         ziZM53e4x8+sW5CTJyMrsLEKWuFqR25vYYClIX9d1gBDG7LlgzVl7dyO4ta3FRA/j+6M
         YnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694729995; x=1695334795;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dMsxVuhdFp5zH/Rhe12VoLyskw7df4SEAa1A1x2XSqM=;
        b=gTXc7VHRgqK2j5PkALTwazJCfVc7bRYUaN/Q1Iahjn5ewcOBvXMcRFCNpNQS8UeD2H
         mxrjScxOazzeJ6+rIkUXl7tUnnoMTv/WQGzt6XxhULnlLs5L4kQpBIoiD3Vm7eFFJxuW
         3RV6BYTzDyL1+KrYaYlm41KsovmBvt+F4EUQyr0PErNygY7aSz58vontDywK8o/6b6B6
         qdq45V6bF722NYllb3/ltLRGN0+V/su9ysheT5doDt7XpqgO0fvIEF7yemShcB2moYTk
         VRhF5IDAidpY1rxvzxGabgt7r5Fu6UXX6VO8nPW1fKoKb/poKeDI+4JMbyCMo2ZI+uDY
         fQrw==
X-Gm-Message-State: AOJu0YwG1UyYL5zkgx9IorofGNPDkHs1KkA+ZpWoshrASnxInNgL4ySz
	60cZadzg2ooB1H1t3zCs7Yi/sUOWX8vdT6cfok5tZlEGikxUPrSKOhFC
X-Google-Smtp-Source: AGHT+IEmXmCj9R58Yxr/2vYzGy8w/YGgKXl+TDAxKiQglA7xfbOu6VZ461kqY0Or3p4rM568oVBr5F3VeyXP0IJZ9VU=
X-Received: by 2002:a50:f60c:0:b0:523:b133:57fe with SMTP id
 c12-20020a50f60c000000b00523b13357femr31194edn.1.1694729995280; Thu, 14 Sep
 2023 15:19:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Bill Wendling <morbo@google.com>
Date: Thu, 14 Sep 2023 15:19:37 -0700
Message-ID: <CAGG=3QVwmn+sLdWUb87hbDEBy63KdYgvExOWJFC6n0wajzhemA@mail.gmail.com>
Subject: [Announcement] Clang-Built Linux Meetup Signup!
To: clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hello!

We have a webpage for those who are attending. It's just to give us a
general idea of who's coming, so it's a very short form:

    http://shortn/_MtOydwQiGs

Hope to see you there!

-bw
