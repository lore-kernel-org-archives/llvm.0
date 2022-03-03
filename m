Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805DC7E
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 15:18:15 +0000 (UTC)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net [108.7.220.252])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 223FEGv9016300
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Mar 2022 10:14:16 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 0A9A315C0038; Thu,  3 Mar 2022 10:14:16 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Colin Ian King <colin.i.king@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, kernel-janitors@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] ext4: remove redundant assignment to variable split_flag1
Date: Thu,  3 Mar 2022 10:14:09 -0500
Message-Id: <164632037182.689479.9390107109546635119.b4-ty@mit.edu>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220301121644.997833-1-colin.i.king@gmail.com>
References: <20220301121644.997833-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 1 Mar 2022 12:16:44 +0000, Colin Ian King wrote:
> Variable split_flag1 is being assigned a value that is never read,
> it is being re-assigned a new value in the following code block.
> The assignment is redundant and can be removed.
> 
> Cleans up clang scan build warning:
> fs/ext4/extents.c:3371:2: warning: Value stored to 'split_flag1' is
> never read [deadcode.DeadStores]
> 
> [...]

Applied, thanks!

[1/1] ext4: remove redundant assignment to variable split_flag1
      commit: 6b71b69dd98b197deea0806417e88308e0876a10

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
