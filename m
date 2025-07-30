Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FC3221F34;
	Wed, 30 Jul 2025 07:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859528; cv=none; b=P7PnIsJMkCuJB8jQSIvlw2l2zSrA24oaF7VkEWS8nHzgNceE7nFTrBl19/5SkeKgCDpG11iRwTWYEn+ymx2rOYeSWLkmkCYUq0hyhBUyZgPBf3uN3MB0qYKiV3jHf0aChW/pFMNtctyVA8+/rDgx1gJOAD+0FNIYuXK7CbJgfcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859528; c=relaxed/simple;
	bh=2fWlqY22QCcbwVVuEaZ1oytimU7BimITytlXmQs7NNw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eru6ctKKI0S+zrUk+2MAepYaLuJY8eCJqUCguIRIq9ar2CCY6EyyICVFFDsoGmU7yohPdWiyU6lhnpB98BA8iClL/fHQBKN8iVJYQDP9ecKKRzDAf2SD/1WQhYVariLtROghdEysr21jNz7J1OkAHst4L+bJoa8n2u4Fskln0Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201603.home.langchao.com
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202507301510512893;
        Wed, 30 Jul 2025 15:10:51 +0800
Received: from localhost.localdomain.com (10.94.10.113) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server id
 15.1.2507.57; Wed, 30 Jul 2025 15:10:49 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: <lkp@intel.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] gpu: drm: fix compilation errors in drm_vram_helper
Date: Wed, 30 Jul 2025 15:09:17 +0800
Message-ID: <20250730071002.2697-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <202507300646.kTchyjvh-lkp@intel.com>
References: <202507300646.kTchyjvh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 2025730151051cdb962acdcf8dce77254f561bd1f48ac
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

I see. This compilation error was caused by the configuration option not automatically selecting DRM_TTM_HELPER. A revised version of the PR has been submitted.

