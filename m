Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CD6EC2
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 09:48:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 259C81474;
	Thu, 28 Apr 2022 02:48:25 -0700 (PDT)
Received: from e123427-lin.home (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 308463F774;
	Thu, 28 Apr 2022 02:48:23 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Colin Ian King <colin.i.king@gmail.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] PCI: versatile: Remove redundant variable retval
Date: Thu, 28 Apr 2022 10:48:06 +0100
Message-Id: <165113925739.24331.3750415057440371912.b4-ty@arm.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220418144416.86121-1-colin.i.king@gmail.com>
References: <20220418144416.86121-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 18 Apr 2022 15:44:16 +0100, Colin Ian King wrote:
> Variable retval is being assigned a value that is never read, the
> variable is redundant and can be removed.
> 
> Cleans up clang scan build warning:
> drivers/pci/controller/pci-versatile.c:37:10: warning: Although the value
> stored to 'retval' is used in the enclosing expression, the value is never
> actually read from 'retval' [deadcode.DeadStores]
> 
> [...]

Applied to pci/versatile, thanks!

[1/1] PCI: versatile: Remove redundant variable retval
      https://git.kernel.org/lpieralisi/pci/c/6086987bde

Thanks,
Lorenzo
