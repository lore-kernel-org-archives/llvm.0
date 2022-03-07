Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B4E7E
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 16:56:48 +0000 (UTC)
Received: from smtpclient.apple (p5b3d2910.dip0.t-ipconnect.de [91.61.41.16])
	by mail.holtmann.org (Postfix) with ESMTPSA id 765DCCED19;
	Mon,  7 Mar 2022 17:50:02 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH] Bluetooth: mgmt: remove redundant assignment to variable
 cur_len
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20220307155338.140860-1-colin.i.king@gmail.com>
Date: Mon, 7 Mar 2022 17:50:01 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 BlueZ <linux-bluetooth@vger.kernel.org>,
 "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
 kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <4B2F2958-85E4-42F6-9F45-1D7DA6396CB1@holtmann.org>
References: <20220307155338.140860-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)

Hi Colin,

> Variable cur_len is being ininitialized with a value in the start of
> a for-loop but this is never read, it is being re-assigned a new value
> on the first statement in the for-loop.  The initialization is =
redundant
> and can be removed.
>=20
> Cleans up clang scan build warning:
> net/bluetooth/mgmt.c:7958:14: warning: Although the value stored to =
'cur_len'
> is used in the enclosing expression, the value is never actually read
> from 'cur_len' [deadcode.DeadStores]
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
> net/bluetooth/mgmt.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

