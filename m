Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795883170;
	b=b7oEk7P4F+ahrtOhZHdQ90esZ5RimZIOtg5sG7mKmtd3nqdcEC2HLyeOrlw8DMFUU0Ve
	 bTrTJl7B86Ydb012MUNGxpQE9m5pSDUanWgbI5twQpYMwn6q5AV/PspgcVX4WL/5U8lBh
	 0OzBwtYPaDkDud7tzOGZ8kYSu3XukagtGHwQ2kNErTqC6iqH2LFBCA9ak3Ym+xh5hFGUA
	 2U1M/vnd73uWVXuYRo6TCLmX2yDJRwTPhPNI3CDDXKYz5kbWGqGWpyIj+SF3D2kfAUjp8
	 w603fYHdOSCUppCkWzmW5x85P5KoiUT4Or9ONIA+HOB+VS8mY6DYs2yIC3DAEwWfsAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795883170;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0Ic80AEaRx36IaB+hMrIQN80NyUsmhjyvx3E1suBk1g=;
	b=i2xIGYDzyziLPE/Sfw5PhozXmGIbnmht5p2Tf59MCLSUVnSKy7zWX8p88Lj9NKANsa7Q
	 TRWZ61OruSsAQHV1YR/36bm5Dy36UP6MtQ4iyPRpDPdcZlQi8617eiWgkz6WBzqb2Rmdt
	 jJ93nW+T8+ggUtwXko6SON5Ffu1oK74dYkfUnic5nq1En/vXV9vGNvtU4hKJyFb35nmu8
	 05xmlMNVJuhlGj8t3xNSnkZ0XC9QLpu27B1z2U+iaCqnoyHjjTI6XPKDGi/HrZ1AO+Rj4
	 CaAh2lTVH1vBUWa1FqRV+NEnJmmVQfx1kR60ZgWL2heRmzfCTo7S8Kmkqwtv9xYmSjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S8wF0dD+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE55606A321
	for <llvm@lists.linux.dev>; Sat, 28 Nov 2026 16:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S8wF0dD+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A101F00893;
	Sat, 28 Nov 2026 16:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795883170;
	bh=0Ic80AEaRx36IaB+hMrIQN80NyUsmhjyvx3E1suBk1g=;
	h=From:Date:Subject:To:Cc;
	b=S8wF0dD+DCNopucU0gLQ0JpZZVzjFaCn7IJf3Rux+O4FovmcAVov4P5t/nrN07NSZ
	 v23I7ioNRbCbKTHnuJxvw1LHQo9ZcGQagLtYCZ2GCHmSOBTGqHEiUKsu01sa9+virt
	 QZDfLztl9/epcOOBzSEj4JaL14e8D2vxcIvoZsQOpeAO9xI3jeALVrO38YiHnVGWfx
	 3e7fEVoVY4gAmpR6tNgizYHto3Jex4bE5f2xCCQkCanwVrS50sH+EtgJWHVtl5pFd8
	 bIX1FAzxk5aRQ6GSCq6JudOJ3AqQx08O4Aeks1HMJ0FTxZ7V/JhtbwXGm1wkYdCrxh
	 SKfn/w7mJChdA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sat, 28 Nov 2026 09:25:57 -0700
Subject: [PATCH] drm/amdgpu: Initialize data to NULL in
 imu_v13_0_program_rlc_ram()
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-amdgpu-uninitialized-data-imu_v13_0-v1-1-e2c0ddb75ee7@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXNTQ6CMBBA4auQWTsJrdJYr2IIKcyAY6SS/hAj4
 e5WXX6b9zaIHIQjXKoNAq8S5ekL1KGC4eb8xChUDLrWRil9RjfTtGTMXrwkcQ95MyG55FDm3K3
 q2NVoG9Pb02gaSwSltAQe5fW7XNu/Y+7vPKRvGvb9A0sbSqKHAAAA
X-Change-ID: 20261128-amdgpu-uninitialized-data-imu_v13_0-956b94f659dd
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>, Frank Min <Frank.Min@amd.com>, 
 Likun Gao <Likun.Gao@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=nathan@kernel.org;
 h=from:subject:message-id; bh=gBmpC7sVg3kQTwjqKfmrRg3ricTg1VnhwUHCCU43UDk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDNncDHOMq2PmfbxjXjyzQ4YtvTRLwcnDLO77FOsrFuev7
 ordHre6o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzElY3hn52h3nHe8wIzoxKi
 Tp63//GZ3TozuTrSOtbGhO+8lt6FtYwMLxSb2LoPeD9M2XjgqTLjnbJJbq0twa+br53U/vmh6+1
 ZBgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Clang warns (or errors with CONFIG_WERROR=y / W=e):

  drivers/gpu/drm/amd/amdgpu/imu_v13_0.c:264:30: error: variable 'data' is uninitialized when used here [-Werror,-Wuninitialized]
    264 |                         program_imu_rlc_ram(adev, data, (const u32)size);
        |                                                   ^~~~

It is not wrong that data is passed to program_imu_rlc_ram()
uninitialized but since this warning happens early in clang's frontend,
it cannot see program_imu_rlc_ram() is meber called due to r being
-EINVAL and even if it were, data would not be dereferenced because size
is 0, so it is never actually used uninitialized.

It is bad form to pass uninitialized values to functions even if they
are not used, so just initialize data to NULL to silence the warning, as
it will need to be properly set up when support for calling
program_imu_rlc_ram() is added.

Fixes: 9caddf5f7de7 ("drm/amdgpu: Add imu v13 ip block v2")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/imu_v13_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/imu_v13_0.c b/drivers/gpu/drm/amd/amdgpu/imu_v13_0.c
index aea418be444a..eb18c7d3e120 100644
--- a/drivers/gpu/drm/amd/amdgpu/imu_v13_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/imu_v13_0.c
@@ -253,7 +253,7 @@ static void program_imu_rlc_ram(struct amdgpu_device *adev,
 static void imu_v13_0_program_rlc_ram(struct amdgpu_device *adev)
 {
 	u32 reg_data, size = 0;
-	const u32 *data;
+	const u32 *data = NULL;
 	int r = -EINVAL;
 
 	WREG32_SOC15(GC, 0, regGFX_IMU_RLC_RAM_INDEX, 0x2);

---
base-commit: fc652f23f1c3c727e561ca66bafd58000208e3a9
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261128-amdgpu-uninitialized-data-imu_v13_0-956b94f659dd

Best regards,
--  
Cheers,
Nathan

