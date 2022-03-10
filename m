Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D565CA9
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 22:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A48C340E8;
	Thu, 10 Mar 2022 22:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646950176;
	bh=tMUOhG6pFcuv+nm+xL9hctLl6S7C9WHjH9Uakei9h3Q=;
	h=From:To:Cc:Subject:Date:From;
	b=XlPypQDQiKimc+h5jKNd/kO20l9tAqk2BjsVoie/Ir707iCNJhlJgKriUcj3G2zdX
	 8m01cRbngXRKN0YjPpanM5FEfNRSpfYRchDNbi2tLcAO9qCl/FbpIVHNx/qSQjo4HE
	 r4PL8GZy442kLEBI7fKQAiDtPC/W//sp1Vtz6UKA22WfZ4Y7lAJeGkfCsrlqVVdR3Y
	 ovazFtLUEt/TlGYsrimlshq2DcRGEDMrRmnCis+9h06SO3Dd65pkUANXuiwvRQhq8F
	 t9bH9RpU5iz2pydQQJFd0F60Hybi4JRKNf+CoIM0Q+tbigNW7gqiYYw9i0rRaF/jMy
	 OaWfZLNLMlYEA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 0/2] linux/types.h: Tidy __bitwise, add __CHECKER__ hints
Date: Thu, 10 Mar 2022 16:09:25 -0600
Message-Id: <20220310220927.245704-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bjorn Helgaas <bhelgaas@google.com>

- Tidy up __bitwise__, which is unused except in the __bitwise definition

- Add hints about what __CHECKER__ means

Bjorn Helgaas (2):
  linux/types.h: Remove unnecessary __bitwise__
  Documentation/sparse: Add hints about __CHECKER__

 Documentation/dev-tools/sparse.rst | 2 ++
 include/linux/compiler_types.h     | 1 +
 include/uapi/linux/types.h         | 6 +++---
 3 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.25.1

