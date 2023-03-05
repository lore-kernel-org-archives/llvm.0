Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E9F28EF
	for <llvm@lists.linux.dev>; Sun,  5 Mar 2023 13:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79AA3C433EF;
	Sun,  5 Mar 2023 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678024462;
	bh=AHZxvroEmYIa6houU/IrOk4YXJYcirNChFLpMSlmgfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q3JpGZYW09A2Tf6E8oplijmXxL9Tkpth8qQTsHvKF881BZCx+P+Do+i7kEVAK9O7d
	 IGwK1kSk7H/Y3IOkqd2gXCXfwEzWlKzc5FD5M42pZ0cbTrEb9E7PGTRZHV+E53L5Lm
	 XI32ctVVgzC4Ij7SHRYc6NTGUF5dKk4wGwfdvaK7E3YhVDSpwYwYweExdyVrW9g5Vg
	 VrWY08LUhVa7aKe5q2/k3bv0ShoP8XaKLqpPQ8JtNKDY+DBsjl5z//ZniJqrBreiwl
	 lFTjGGsHwJwhzTLWf+/R4d8pqIWWvM5+TtKhXcZp+zyNfIgyJHtOrU3YzxoLUsDqYE
	 E51kqt2gKt4VA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sasha Levin <sashal@kernel.org>,
	benh@kernel.crashing.org,
	ndesaulniers@google.com,
	u.kleine-koenig@pengutronix.de,
	khalasa@piap.pl,
	gregkh@linuxfoundation.org,
	srinivas.pandruvada@linux.intel.com,
	christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 7/9] macintosh: windfarm: Use unsigned type for 1-bit bitfields
Date: Sun,  5 Mar 2023 08:53:57 -0500
Message-Id: <20230305135359.1793830-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305135359.1793830-1-sashal@kernel.org>
References: <20230305135359.1793830-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 748ea32d2dbd813d3bd958117bde5191182f909a ]

Clang warns:

  drivers/macintosh/windfarm_lm75_sensor.c:63:14: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
                  lm->inited = 1;
                             ^ ~

  drivers/macintosh/windfarm_smu_sensors.c:356:19: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
                  pow->fake_volts = 1;
                                  ^ ~
  drivers/macintosh/windfarm_smu_sensors.c:368:18: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
                  pow->quadratic = 1;
                                 ^ ~

There is no bug here since no code checks the actual value of these
fields, just whether or not they are zero (boolean context), but this
can be easily fixed by switching to an unsigned type.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20230215-windfarm-wsingle-bit-bitfield-constant-conversion-v1-1-26415072e855@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/macintosh/windfarm_lm75_sensor.c | 4 ++--
 drivers/macintosh/windfarm_smu_sensors.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/macintosh/windfarm_lm75_sensor.c b/drivers/macintosh/windfarm_lm75_sensor.c
index 29f48c2028b6d..e90ad1b78e936 100644
--- a/drivers/macintosh/windfarm_lm75_sensor.c
+++ b/drivers/macintosh/windfarm_lm75_sensor.c
@@ -34,8 +34,8 @@
 #endif
 
 struct wf_lm75_sensor {
-	int			ds1775 : 1;
-	int			inited : 1;
+	unsigned int		ds1775 : 1;
+	unsigned int		inited : 1;
 	struct i2c_client	*i2c;
 	struct wf_sensor	sens;
 };
diff --git a/drivers/macintosh/windfarm_smu_sensors.c b/drivers/macintosh/windfarm_smu_sensors.c
index c8706cfb83fd8..714c1e14074ed 100644
--- a/drivers/macintosh/windfarm_smu_sensors.c
+++ b/drivers/macintosh/windfarm_smu_sensors.c
@@ -273,8 +273,8 @@ struct smu_cpu_power_sensor {
 	struct list_head	link;
 	struct wf_sensor	*volts;
 	struct wf_sensor	*amps;
-	int			fake_volts : 1;
-	int			quadratic : 1;
+	unsigned int		fake_volts : 1;
+	unsigned int		quadratic : 1;
 	struct wf_sensor	sens;
 };
 #define to_smu_cpu_power(c) container_of(c, struct smu_cpu_power_sensor, sens)
-- 
2.39.2

