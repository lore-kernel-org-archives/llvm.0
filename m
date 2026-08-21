Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6FF175A9C
	for <llvm@lists.linux.dev>; Fri, 21 Aug 2026 02:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787280129; cv=none; b=A8g7WW+EVFKFIBVyxh3yes+jWMQAWu2Qay19a+fwmHI7NUcY5o/18Da6du4PBbrqG8YphIpFcmBuBsKBU9y47dN2HhB7rT+BOU3Y/6c5mky+kVx/83E7WtN7O3d59CdwypHOKhtwNT0PTD/GpM6JTyihKSg1OvipuiPZhnDneGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787280129; c=relaxed/simple;
	bh=aq7vyztkJiNYtWBSR4vw5/P3rQEpQ54flUNd/8NVWHU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=DEZxDMw7fp6HjQK0ISpqJ6hZh9jJPqbh8I6c0U2U1wi5Gnj1kNPN2S9v2+EoUKUvfAgScyAZpaK1CIeiL33J/4lbvtKKi2snq2wQl2/zCPOQAdL3UmuQRDcGg8JY5EgEnd1gfIjyEJV8LdkEVqXv05+riA7JQquZ+Np/UHpWn/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jrypo/nF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jrypo/nF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787280126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W6L+vWhzbq+op+/ajwPzVToxL9Ty5ChX+w5r2PLEkDE=;
	b=Jrypo/nFtLV7bP5Y7r+1eygPP7J3BD6e2/OGsXOY+ILa1bNKknQdDqpvsB8rsF5pxh4SQn
	9wWusA/k05lluwDd+5uT1Pj8cRBpQd1XRQxauNMwrHRAEZAE2YkrugoVdHFC91AiduEOcS
	DjGqCbleh6VEpA94bXWnh1XUYi40dEQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-537-v9-3X9DAMAqBuavCEFBC_Q-1; Thu,
 20 Aug 2026 22:42:05 -0400
X-MC-Unique: v9-3X9DAMAqBuavCEFBC_Q-1
X-Mimecast-MFC-AGG-ID: v9-3X9DAMAqBuavCEFBC_Q_1787280124
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 97CC5195609D
	for <llvm@lists.linux.dev>; Fri, 21 Aug 2026 02:42:04 +0000 (UTC)
Received: from [172.20.61.140] (unknown [10.30.44.61])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2ABEB3002D26;
	Fri, 21 Aug 2026 02:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 60 of 66): Test report for master
 (7.2.0-0, upstream-mainline, 77ae27fd)
Date: Fri, 21 Aug 2026 02:42:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <48992.126082022420501850@us-mta-537.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HYrW2GEjHzwdVEGcEijhhelG44kwQOvihsVvTDGmcXA_1787280124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'printk-for-7.3' of git://git.kernel.org/pub/=
scm/linux/kernel/git/printk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2778038566

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, x86_64]
    /distribution/command [aarch64, x86_64]
    /test/misc/machineinfo [aarch64, x86_64]
    Boot test [aarch64, x86_64]
    CKI/restraint [aarch64, x86_64]
    Reboot test [aarch64, x86_64]
    SELinux Custom Module Setup [aarch64, x86_64]
    selinux-policy: serge-testsuite [aarch64, x86_64]
    Storage - blktests - throtl [aarch64, x86_64]
    Storage - blktests - ublk [aarch64, x86_64]
    stress: stress-ng - cpu-cache [aarch64, x86_64]
    stress: stress-ng - memory [aarch64, x86_64]
    xfstests - btrfs [aarch64, x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [aarch64, x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [aarch64, x86_64]


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

