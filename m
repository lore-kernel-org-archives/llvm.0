Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D99E747B
	for <llvm@lists.linux.dev>; Mon,  3 Apr 2023 18:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26910C433EF;
	Mon,  3 Apr 2023 18:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680546245;
	bh=UeZr5YfS0Yaf22ilGxKJbw+QT9yD62PihrxxHaRSgTg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TCdSd8Wrnkf00o30c4E3aJ09Rbsc6zlmDsTZli3Wi6n8Ivqomk473wt8qV58OLDMH
	 rYL8OqMCoSK5mXr590SCgS+QS88RB5/Zg5LW/qhvWxkSOJ4+tubYDcNB5PstwvvcU6
	 5ypEfCmQRciO72a52CuWZx29YIyN7DyYtyPWn+a+ADcauaM2KlHMSCt3xFotT/qmH2
	 DHjkGVHFUHvxsHBMMkU+F28BzpsX+0kbf8+ZUqIKJ0zwE1vJagU0/96w2gISGlsyNe
	 tFlcz4vIwA4vYTqjLuT0igvId0tpmhvfCjqttM883erTnpTjxlFS0HN4E+HcbOvz3X
	 liEKe4ltb4JaA==
From: Leon Romanovsky <leon@kernel.org>
To: dennis.dalessandro@cornelisnetworks.com, jgg@ziepe.ca, nathan@kernel.org,
 ndesaulniers@google.com, Tom Rix <trix@redhat.com>
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
In-Reply-To: <20230330235800.1845815-1-trix@redhat.com>
References: <20230330235800.1845815-1-trix@redhat.com>
Subject: Re: [PATCH] IB/qib: remove unused cnt variable
Message-Id: <168054624148.6296.6352837498286911660.b4-ty@kernel.org>
Date: Mon, 03 Apr 2023 21:24:01 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-a055d


On Thu, 30 Mar 2023 19:58:00 -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/infiniband/hw/qib/qib_file_ops.c:487:20: error: variable
>   'cnt' set but not used [-Werror,-Wunused-but-set-variable]
>         u32 tid, ctxttid, cnt, limit, tidcnt;
>                           ^
> drivers/infiniband/hw/qib/qib_file_ops.c:1771:9: error: variable
>   'cnt' set but not used [-Werror,-Wunused-but-set-variable]
>         int i, cnt = 0, maxtid = ctxt_tidbase + dd->rcvtidcnt;
>                ^
> This variable is not used so remove it.
> 
> [...]

Applied, thanks!

[1/1] IB/qib: remove unused cnt variable
      https://git.kernel.org/rdma/rdma/c/e7706c4bbfe88f

Best regards,
-- 
Leon Romanovsky <leon@kernel.org>
