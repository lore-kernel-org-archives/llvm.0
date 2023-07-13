Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6512D63A0
	for <llvm@lists.linux.dev>; Thu, 13 Jul 2023 07:57:13 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so452364a12.1
        for <llvm@lists.linux.dev>; Thu, 13 Jul 2023 00:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689235031; x=1689839831;
        h=cc:to:subject:message-id:date:from:sender:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBeF8DimtieRIbeczjrQAO7Bmt6r/83M9FTzR+dYQus=;
        b=j/nV/8M8qJDGiBFI8327yymczZxYK3EfM6/n5B+YZFgBAbsM/NkhigpTrpzmhftlim
         sU9+IpUQhH+EozlQ8N+xthICiD87MdzfWGGhmOFrlFvVBLBZ9RyIXawww6pS6oMMOD/W
         34dGfPC+7nNIb6RO65P3JlWDda6SSyv+raLu1gVioQGyGlxCj3oloUL1ds0vxrQgqfoW
         ivlzJxRwt4BvvmFntFjoZL/7wSo0p91OqWuP3X+UtA63HEeE9BvbSLAjMh2X08w/PTcR
         YHluygjJ7slsd5eqGK/SAm+AlFSvlynVotNqmbbccE7lLTZQU+JpYjYHBvO/E0k1Ezgh
         0j/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689235031; x=1689839831;
        h=cc:to:subject:message-id:date:from:sender:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBeF8DimtieRIbeczjrQAO7Bmt6r/83M9FTzR+dYQus=;
        b=gNqoBu2APLYhRg2TXaElHwfemBFevkkquYul31OSamH3d3BT4EKBjqpo4PtGqCoDX6
         uS7jtK6SJ+vLSOEf5dxCW8osdm4B4VCPcJB3wkpNh3V+aGhLDZKTpXQOwQO9gMZjbvl9
         A9kuKiMhA7xxCHQ9PBwwq87+Zsgks4hIp4FTovwDmmuiJx45Wne1Mj9Jh2uRwKqXGJRU
         FZwKNJTcL1QW83rG1EWl0PoXD0+OvgAJiKqmSGSHKh0VdFqF8FhovkTH48x3EhwPW4Bu
         5iPxAi4vxO9VtSweqrlnmq5RCtHFrC/vKkqPiA4lu6vRmWAmc/m9jJXmeM4nLEXKaaD+
         zyew==
X-Gm-Message-State: ABy/qLaKFeMq2zCJkauqBC8GsfM+CrvUAUdEsQNBrXVzoJ7qXlRD8eum
	LhZyeZnd5NTEVMgbFCatA2DEcsY1fTqOnNl3XBM=
X-Google-Smtp-Source: APBJJlHbM+0P718q61QkhmRg2sZBdOo9EtDJ8+TrS+eXLQDo5tAoYPNE/0mM/eZP5gei9DkV5833SS3E0v0Hx3rZF2E=
X-Received: by 2002:aa7:c90f:0:b0:51e:f83:6de6 with SMTP id
 b15-20020aa7c90f000000b0051e0f836de6mr1240233edt.16.1689235031366; Thu, 13
 Jul 2023 00:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <tencent_8D245D1A87D17619EA8475E8F005A151000A@qq.com>
 <65f4c60a-9534-56dc-099f-ee7a96e0ccaf@redhat.com> <20230712235813.GE6354@monkey>
In-Reply-To: <20230712235813.GE6354@monkey>
Sender: cl1ntlov3@gmail.com
X-Google-Sender-Delegation: cl1ntlov3@gmail.com
From: linke li <lilinke99@gmail.com>
Date: Thu, 13 Jul 2023 15:57:00 +0800
X-Google-Sender-Auth: AOlVQvJu9wTequs-Y5TVT_XTP9o
Message-ID: <CAKdjhyD4RVHFVLrcfcuEnvwrjjxAk_GL=kjcm1iw3WTrmmFb9Q@mail.gmail.com>
Subject: Re: [PATCH] hugetlbfs: Fix integer overflow check in hugetlbfs_file_mmap()
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, Linke Li <lilinke99@foxmail.com>, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, trix@redhat.com, 
	ndesaulniers@google.com, nathan@kernel.org, muchun.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

> However, if this is a real issue it would make more
> sense to look for and change all such checks rather than one single occurrence.

Hi, Mike. I have checked the example code you provided, and the
difference between
those codes and the patched code is that those checks are checks for
unsigned integer
 overflow, which is well-defined. Only undefined behavior poses a
security risk. So they
 don't need any modifications. I have only found one occurrence of
signed number
overflow so far.

Thank you for your valuable feedback.
