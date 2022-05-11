Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6722F25
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 17:34:19 +0000 (UTC)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Kz28M3JKMzMq1PY;
	Wed, 11 May 2022 19:34:11 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Kz28L0d0vzljsVB;
	Wed, 11 May 2022 19:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1652290451;
	bh=G0hs62nfpGjWlOuhAXhBiuFTtxkNwrbiWL50GjtiUpg=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=H1xdyS6uzExUVTleMkgRO/LnlzqZH0UkHhcSUl/P7DycKdX3FBXmhmiMpe98X8JWp
	 rOpuHAD34t4L7thf6KiYS++C91oc+jvZR6orUtn3xDhnQikA8a97nKW9DHAF2xsCA6
	 ESoYTb3ST4n7MF/bcjlDug8kdiKGaNebcfcFcI+8=
Message-ID: <d519b20b-694a-d8a7-66ed-1c5961590d4b@digikod.net>
Date: Wed, 11 May 2022 19:34:09 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Content-Language: en-US
To: Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Andy Whitcroft <apw@canonical.com>,
 Brian Norris <briannorris@chromium.org>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, Kees Cook <keescook@chromium.org>,
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Paul Moore
 <paul@paul-moore.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220506160106.522341-1-mic@digikod.net>
 <20220506160106.522341-6-mic@digikod.net>
 <e40f779c7de2f9abe5fdd76d0a77477e4bf1fe32.camel@perches.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: [PATCH v2 5/5] clang-format: Fix space after for_each macros
In-Reply-To: <e40f779c7de2f9abe5fdd76d0a77477e4bf1fe32.camel@perches.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/05/2022 17:40, Joe Perches wrote:
> On Fri, 2022-05-06 at 18:01 +0200, Mickaël Salaün wrote:
>> Set SpaceBeforeParens to ControlStatementsExceptForEachMacros to not add
>> space between a for_each macro and the following parenthesis.  This
>> option is available since clang-format-11 [1] and is in line with the
>> checkpatch.pl rules [2].
> 
> If this is applied, could the .clang_format ForEachMacros:
> block be removed?

The ForEachMacros block is still required to not put the " {" on the 
next line.
