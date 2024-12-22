Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7637B28F4
	for <llvm@lists.linux.dev>; Sun, 22 Dec 2024 01:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734829932; cv=none; b=UpianTB4+w1vFQzr2uRkYL+znyuOPkGeVCssZt4yQF3UXz00d7qjqHi+WyBsuCZiKc2hEZ3Z1o2I3FGUly1NbCHJ85maqvBvP/fFEUP5j8HUd94MHYI9eIRU68nJqzLZOQbaekG+Y92UsVkiC+eIJztDSWgmmo/w44IOGVqghis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734829932; c=relaxed/simple;
	bh=AE28l6lhaJv4f3SDO9U2d1HcGf7OvvnGzJnxl7J72dM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=YSUx7/YO0h3rX943oZNhxp14sdue4FH3c3qrxM9aFeh0MIKDOMZI1bbq2zHZ3gEvkHfvO24OVGY/fQ1g4EJ/tJQLJyB48AhpQtZXLiwt4+BLbzevFh+sQ/oyvFk9UObuA36gey0o9Y/n9JGzWbMeawklXfPqclFkiB4iTFysrCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=heTgH+Pe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="heTgH+Pe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734829928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UahwhF/Va4gQ1uJ0b74+8I948ry5w9b20nfTQ1ufN1I=;
	b=heTgH+Pe+b5fB0RzkWaL+gJg42H1Z3MVhFQoNDVhcOVLEsr8vJ39voQy/fMe0InnmKNIXF
	hRi982swiSoUT/LpwpH7uBmHXW/kfjd+fVwMQus1qDyYHFJhqPnWTVv30dGjiIBfaZo1Db
	6a87tehJeCvqss2Gtui8ZRYY5b0IW8E=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-161-CFtfqvWrM3mFUbfn-VdZ3w-1; Sat,
 21 Dec 2024 20:12:06 -0500
X-MC-Unique: CFtfqvWrM3mFUbfn-VdZ3w-1
X-Mimecast-MFC-AGG-ID: CFtfqvWrM3mFUbfn-VdZ3w
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD6271956089
	for <llvm@lists.linux.dev>; Sun, 22 Dec 2024 01:12:05 +0000 (UTC)
Received: from [172.64.13.20] (unknown [10.30.32.164])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4A89D1956086;
	Sun, 22 Dec 2024 01:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc3,
 upstream-mainline, 48f506ad)
Date: Sun, 22 Dec 2024 01:12:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <21263.124122120120600225@us-mta-161.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dyj0keg8mlGI1dxHne95-3kru5RYN20v309vHUEUjh4_1734829926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'soc-fixes-6.13-2' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/soc/soc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1599160784

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1599160784-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1599160784-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1599160784-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

