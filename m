Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1047C
	for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 14:07:40 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4KlqFz34jpzMqFML;
	Sat, 23 Apr 2022 13:45:11 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4KlqFy3YgyzlhMBp;
	Sat, 23 Apr 2022 13:45:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1650714311;
	bh=5oQ+gRaiMvtEmoQjhrcqrcZbqQiRRGUiVauT8l/YIQU=;
	h=Date:To:Cc:From:Subject:From;
	b=X84gzasPjND065BI1BzERxp7HpevtXwsQbaIe15uCtTStL6S1Q/V7CFIArfwtt8pp
	 FwdxXUNUr71+nSLSL/qrQ1paWTurUsMBrs7qfuKngfKjiBoXTvGUq2jAODf47ZE5rD
	 YDzZO6MjIb62DtLBmJjhHe8yitj0g4lI8apNWiRU=
Message-ID: <8b6b252b-47a6-9d52-f0bd-10d3bc4ad244@digikod.net>
Date: Sat, 23 Apr 2022 13:45:32 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Content-Language: en-US
To: Miguel Ojeda <ojeda@kernel.org>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: clang-format inconsistencies with checkpatch.pl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I would like to use clang-format (with a pinned version, probably 14) to 
keep a consistent coding style, or at least start with one. However, 
there is some inconsistencies with the checkpatch.pl script:

In some cases, goto labels are indented, which checkpatch.pl doesn't like.

checkpatch.pl complains about some functions (e.g. FIXTURE or 
FIXTURE_VARIANT_ADD) that get an open brace just after but without a space.

I also noticed that there is some clang-format configuration lines that 
are commented because of incompatibilities with versions older than 6. 
Shouldn't we require a minimal version, at least the 6th?

About checkpatch.pl, it incorrectly warns about space between function 
name and open parenthesis for *for_each* functions (specifically 
interpreted as "for" statements in .clang-format, e.g. list_for_each_entry).

Regards,
  Mickaël
