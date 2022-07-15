Received: from relay5.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E575117F3
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 06:33:07 +0000 (UTC)
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay11.hostedemail.com (Postfix) with ESMTP id A206D803A7;
	Fri, 15 Jul 2022 06:32:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id 391E81C;
	Fri, 15 Jul 2022 06:32:54 +0000 (UTC)
Message-ID: <84e873c27f2426ce003e650004fe856bf72c634b.camel@perches.com>
Subject: Re: [PATCH] mediatek: mt7601u: fix clang -Wformat warning
From: Joe Perches <joe@perches.com>
To: Justin Stitt <justinstitt@google.com>, Jakub Kicinski <kubakici@wp.pl>, 
 Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Thu, 14 Jul 2022 23:32:53 -0700
In-Reply-To: <20220711212932.1501592-1-justinstitt@google.com>
References: <20220711212932.1501592-1-justinstitt@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Spam-Status: No, score=-3.09
X-Stat-Signature: 1hso3syzywufyzhw636x1fz9p96yse9u
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 391E81C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18D0NiRIZaOhSqXbeaEBffV+4ygx6yiPXw=
X-HE-Tag: 1657866774-101434

On Mon, 2022-07-11 at 14:29 -0700, Justin Stitt wrote:
> When building with Clang we encounter this warning:
> > drivers/net/wireless/mediatek/mt7601u/debugfs.c:92:6: error: format
> > specifies type 'unsigned char' but the argument has type 'int'
> > [-Werror,-Wformat] dev->ee->reg.start + dev->ee->reg.num - 1);
>=20
> The format specifier used is `%hhu` which describes a u8. Both
> `dev->ee->reg.start` and `.num` are u8 as well. However, the expression
> as a whole is promoted to an int as you cannot get smaller-than-int from
> addition. Therefore, to fix the warning, use the promoted-to-type's
> format specifier -- in this case `%d`.

I think whenever a sizeof(unsigned type) that is less than sizeof(int) is
emitted with vsprintf, the preferred format specifier should be %u not %d.

> diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c b/drivers/ne=
t/wireless/mediatek/mt7601u/debugfs.c
[]
> @@ -88,7 +88,7 @@ mt7601u_eeprom_param_show(struct seq_file *file, void *=
data)
>  		   dev->ee->rssi_offset[0], dev->ee->rssi_offset[1]);
>  	seq_printf(file, "Reference temp: %hhx\n", dev->ee->ref_temp);
>  	seq_printf(file, "LNA gain: %hhx\n", dev->ee->lna_gain);
> -	seq_printf(file, "Reg channels: %hhu-%hhu\n", dev->ee->reg.start,
> +	seq_printf(file, "Reg channels: %hhu-%d\n", dev->ee->reg.start,
>  		   dev->ee->reg.start + dev->ee->reg.num - 1);

And this is not a promotion of an argument to int via varargs.
The arithmetic did the promotion.

I suggest s/%hh/%/ for all the uses here, not just this one.

checkpatch could do this somewhat automatically.
Of course any changes it suggests need human review.

$ ./scripts/checkpatch.pl -f drivers/net/wireless/mediatek/mt7601u/debugfs.=
c --show-types --types=3Dunnecessary_modifier --fix-inplace
$ git diff --stat -p drivers/net/wireless/mediatek/mt7601u/debugfs.c
---
 drivers/net/wireless/mediatek/mt7601u/debugfs.c | 22 +++++++++++----------=
-
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c b/drivers/net/=
wireless/mediatek/mt7601u/debugfs.c
index 20669eacb66ea..b7a6376e3352e 100644
--- a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
@@ -83,28 +83,28 @@ mt7601u_eeprom_param_show(struct seq_file *file, void *=
data)
 	struct tssi_data *td =3D &dev->ee->tssi_data;
 	int i;
=20
-	seq_printf(file, "RF freq offset: %hhx\n", dev->ee->rf_freq_off);
-	seq_printf(file, "RSSI offset: %hhx %hhx\n",
+	seq_printf(file, "RF freq offset: %x\n", dev->ee->rf_freq_off);
+	seq_printf(file, "RSSI offset: %x %x\n",
 		   dev->ee->rssi_offset[0], dev->ee->rssi_offset[1]);
-	seq_printf(file, "Reference temp: %hhx\n", dev->ee->ref_temp);
-	seq_printf(file, "LNA gain: %hhx\n", dev->ee->lna_gain);
-	seq_printf(file, "Reg channels: %hhu-%hhu\n", dev->ee->reg.start,
+	seq_printf(file, "Reference temp: %x\n", dev->ee->ref_temp);
+	seq_printf(file, "LNA gain: %x\n", dev->ee->lna_gain);
+	seq_printf(file, "Reg channels: %u-%u\n", dev->ee->reg.start,
 		   dev->ee->reg.start + dev->ee->reg.num - 1);
=20
 	seq_puts(file, "Per rate power:\n");
 	for (i =3D 0; i < 2; i++)
-		seq_printf(file, "\t raw:%02hhx bw20:%02hhx bw40:%02hhx\n",
+		seq_printf(file, "\t raw:%02x bw20:%02x bw40:%02x\n",
 			   rp->cck[i].raw, rp->cck[i].bw20, rp->cck[i].bw40);
 	for (i =3D 0; i < 4; i++)
-		seq_printf(file, "\t raw:%02hhx bw20:%02hhx bw40:%02hhx\n",
+		seq_printf(file, "\t raw:%02x bw20:%02x bw40:%02x\n",
 			   rp->ofdm[i].raw, rp->ofdm[i].bw20, rp->ofdm[i].bw40);
 	for (i =3D 0; i < 4; i++)
-		seq_printf(file, "\t raw:%02hhx bw20:%02hhx bw40:%02hhx\n",
+		seq_printf(file, "\t raw:%02x bw20:%02x bw40:%02x\n",
 			   rp->ht[i].raw, rp->ht[i].bw20, rp->ht[i].bw40);
=20
 	seq_puts(file, "Per channel power:\n");
 	for (i =3D 0; i < 7; i++)
-		seq_printf(file, "\t tx_power  ch%u:%02hhx ch%u:%02hhx\n",
+		seq_printf(file, "\t tx_power  ch%u:%02x ch%u:%02x\n",
 			   i * 2 + 1, dev->ee->chan_pwr[i * 2],
 			   i * 2 + 2, dev->ee->chan_pwr[i * 2 + 1]);
=20
@@ -112,8 +112,8 @@ mt7601u_eeprom_param_show(struct seq_file *file, void *=
data)
 		return 0;
=20
 	seq_puts(file, "TSSI:\n");
-	seq_printf(file, "\t slope:%02hhx\n", td->slope);
-	seq_printf(file, "\t offset=3D%02hhx %02hhx %02hhx\n",
+	seq_printf(file, "\t slope:%02x\n", td->slope);
+	seq_printf(file, "\t offset=3D%02x %02x %02x\n",
 		   td->offset[0], td->offset[1], td->offset[2]);
 	seq_printf(file, "\t delta_off:%08x\n", td->tx0_delta_offset);
=20

