Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D022510A1F
	for <llvm@lists.linux.dev>; Sun, 16 Mar 2025 03:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742097131; cv=none; b=DBlazN7tDHvE3mduIdmcvV0bqkfoOfoQaBUooPA85bOtd15Gv/zymq48Ss9eZ6p6bF60OJEzoM3C4mgEz2cSub50J0D25DruNxZwQILb74j3XjOR72jkgeEe/jbxk/l/z+rjEZDbpsXCm5UxTSx47IF0vx1hBBdyEFrKCP/fSVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742097131; c=relaxed/simple;
	bh=xVUs9DAqkDfPuMEuB6JN0bW1zEcn4MORLsAAYdoin8k=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=cPtEAbPVg9NGIeiAkFtq17WgSFyghEwJKJDDZUPBCdu57wCmpwYSVaiezeF/1TVKORdrQSDDs9tf4u054GN/xwuy0zMvil52dTamN7kdEJRBIVob9EE0Ziavlcpt+2itUcPXkdGrjxVeIyCMz3kcwBSqSroORwM/Y75gZjsWLTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cKhJConO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cKhJConO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742097127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bLQ6U7zUotBFNR8AqLoRy5Hxea3Q+4/Evd2Ko5ms6Ak=;
	b=cKhJConOOPFxuAiQvBJERvWtEdv4CiWeZqLiOJabsvSJjMLY8W+4KNo9poh+PUkDoJmQUd
	xoSIeYOpuwENBYG2k9cuspi3Zf9Nnk0IcQwdVfg4D9iRKTYkhzEEsOonjvZQUGzeAxfbF+
	ZxoouPbZOqBDiugAXfct8UakP+WBuQY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-489-kVPcXtzaPHaMq8xnIynKpg-1; Sat,
 15 Mar 2025 23:52:05 -0400
X-MC-Unique: kVPcXtzaPHaMq8xnIynKpg-1
X-Mimecast-MFC-AGG-ID: kVPcXtzaPHaMq8xnIynKpg_1742097124
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 68DC8180034D
	for <llvm@lists.linux.dev>; Sun, 16 Mar 2025 03:52:04 +0000 (UTC)
Received: from [172.64.0.42] (unknown [10.30.32.80])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F29F03001D0F;
	Sun, 16 Mar 2025 03:52:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc6,
 upstream-mainline, 31d7109a)
Date: Sun, 16 Mar 2025 03:52:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <45739.125031523520500106@us-mta-489.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 92jV6WbgaqlW8jZuG4-Qp36FDZrLR5B_QQzgpQ9ra9k_1742097124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'input-for-v6.14-rc6' of git://git.kernel.org=
/pub/scm/linux/kernel/git/dtor/input

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1718632408

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1718632408-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1718632408-x86_64-kernel
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

