Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCF011CB1
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 16:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1425AC433C7;
	Fri, 15 Sep 2023 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694795005;
	bh=JOS7HaAbiWzydkRJPxuoK7G9XxSEXsa7xq4WjwaZnrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EpvqeroeKqvDzj5v0fwqIVQr2zpcTGmwYvC66xFxYauCod/10TZGDc8Wik7mJ4Hhb
	 CVhqbILqDv8tObFpICe7MQDToqBtM8tmfaQJoY3ODcm8I3R+Xr79y/iUu5GjGFhH71
	 qXAhinnS1MlJtnomwksmQEBlKG1NjQPq5nTiNsXHB9wD9x2r84Zr6/9yfhpQoiO7xg
	 GjxfiTsk3f+qckzSZcjNn84E5BJKC4SLieix5hIEu1LvcUdTiMjWLRuaMSTtAQZXJj
	 urwSLk8RjllT114IsqXLG9UmHtH09LAkqVjqo7r9VfLpAafWe8zQOnaqSDb13/jdYc
	 h2n4nsNiA6LSA==
Date: Fri, 15 Sep 2023 09:23:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Bill Wendling <morbo@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>
Subject: Re: [Announcement] Clang-Built Linux Meetup Signup!
Message-ID: <20230915162323.GA1647281@dev-arch.thelio-3990X>
References: <CAGG=3QVwmn+sLdWUb87hbDEBy63KdYgvExOWJFC6n0wajzhemA@mail.gmail.com>
 <20230914232415.GA1067476@dev-arch.thelio-3990X>
 <CAGG=3QVyHJdjGrPtpAPcSWN4aVV3z7rzxSdJcpgimOuda91JJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGG=3QVyHJdjGrPtpAPcSWN4aVV3z7rzxSdJcpgimOuda91JJQ@mail.gmail.com>

On Thu, Sep 14, 2023 at 10:40:54PM -0700, Bill Wendling wrote:
> Try this one:
> 
> https://docs.google.com/forms/d/e/1FAIpQLSelo9EWhh2HTDY9kDLgm6okPQ0EVMGDq1X8WBsVohdFDfVUXg/viewform?resourcekey=0-5StuGVUlJ-u9TutUZ-_tMA

Thanks, that worked!

Cheers,
Nathan
