Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D160567F
	for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 07:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714114820; cv=none; b=Uwk3VnKkfB2XG6SQfBRgiMxdf6xuSKp+xT9XYJ8hrihNGSyWa0TqH9bWho3i/mJ2zGgBq34wL4B8PPnLrnjhMVEZE4hjPjTtPCw9TP5kVCoFQSr/k9EQ04dhqJSdpTIvQWm3RzAfLSWDuAz0rWgSSbUbOoBSBgQCb47gjmvmkfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714114820; c=relaxed/simple;
	bh=Kp/6EzHFseCjwd4VVe5bygkVZd/6QTzkT0oK1Qhuexc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=k0Zp12CPxvi2aAX7qeT1KQz5KmsN506/LiTnqDnUKgaWXaEK7Gll8x/I/QbdNiHYqsY0Ra8jegoUVU01UXPonvWGW+4TludxbymYcxgT6Mg8Q5CQBgzHrC8EbsVBaLO+l/bGRD2QL5UW9WNYYtcSE54Zuy8A4PTapZVtfoo0Nas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8DxfevxUCtmoVgDAA--.9974S3;
	Fri, 26 Apr 2024 15:00:01 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxhFbvUCtmPQIGAA--.2873S2;
	Fri, 26 Apr 2024 15:00:00 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: ojeda@kernel.org,
	corbet@lwn.net,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn
Cc: Yanteng Si <siyanteng@loongson.cn>,
	linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 0/4] rust: docs: Update the translation of rust to 6.9-rc4
Date: Fri, 26 Apr 2024 14:59:47 +0800
Message-Id: <cover.1714113680.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxhFbvUCtmPQIGAA--.2873S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKFyDZw13WFy8GF4DZF18Zwc_yoWkGrX_A3
	y8ZFWjya1kAF4xKFWxGrW7urW8Cay0v348JFn0q3yDG34DArWDXr1DXF93Wr1fuF45Kry3
	GrZ7J34fCrs3WosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxUGYDUUUU

v2:
* As Miguel's comments, translate commit 01848eee20c6
  into Chinese, as well as commit 81889e8523e6. By the way,
  these two patches haven't appeared in the doc development
  tree yet, maybe we could consider merging them into the
  rust tree?
* As Dongliang's comments, translation "在... 前添加" other
  than "前缀".

v1:
The Chinese version of rust seems to be way behind,
even though we did translate to Chinese at the beginning.
Let's keep them up to date. :)

Yanteng Si (4):
  docs/zh_CN/rust: Update the translation of arch-support to 6.9-rc4
  docs/zh_CN/rust: Update the translation of coding-guidelines to
    6.9-rc4
  docs/zh_CN/rust: Update the translation of general-information to
    6.9-rc4
  docs/zh_CN/rust: Update the translation of quick-start to 6.9-rc4

 .../translations/zh_CN/rust/arch-support.rst  | 14 ++++--
 .../zh_CN/rust/coding-guidelines.rst          | 12 +++++
 .../zh_CN/rust/general-information.rst        |  2 +-
 .../translations/zh_CN/rust/quick-start.rst   | 50 +++++++++++++------
 4 files changed, 56 insertions(+), 22 deletions(-)

-- 
2.31.4

