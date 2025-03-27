Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF180125B2
	for <llvm@lists.linux.dev>; Thu, 27 Mar 2025 22:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743115330; cv=none; b=BFiEeu2SIWes8nJJJr8EcQ/zFgikocxirhKouip0ObZn/K7bpQ9oKVPBkx4My1V1FPPw13UPmHAM1KE2k7iXwIFFpDzNwGdfhjI7o6VTmjX+m3gIa6jkZJw4Qm3M2MJcUjc4QLhOcs6MacoXvWny9mzrZEqWLHqOPQ6iqNgEgHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743115330; c=relaxed/simple;
	bh=TOavwIT5fe8Lhxp/4Z2cTDGTw+uyzhG9Nke8WrKRhLE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=r2BdvZk5NwrmnTsPvbGldpLULjzUSObsomvnLOCd19oYg73gfI06DWRB02wgaAkidK5qXgUz9MjnQuf9DMZLUdNgzmx2vioUN5orJnLwWT8ziobuPP6ANVwr9jTH1yfh2sUu3XuLxT+7FRIpLOwmLnCEtCjwD3p+vIkk6wEIdcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FpHJsm66; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FpHJsm66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743115327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pc2SwG7zPETDo0LZ0L+uOnnZIwKgGFI69rnQTg0Md2A=;
	b=FpHJsm66hv5OYXlZt4mfpD4N8vPEnIMJOvRomwp4lfrUVkX0SEzthJuA/fppVUR9TWclRv
	CyJaWYP+3Q/2SLaJzp/LEf8HKxpj+3t/rRY6RYY1ORuAzT1O0fdQlqlkiTd4Q4MTYIzR5O
	sBGgdxxxmja/UImaJEmzCy1FoRXG9DI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-120-7HLrK8LpMB2sllzwu1rPcw-1; Thu,
 27 Mar 2025 18:42:06 -0400
X-MC-Unique: 7HLrK8LpMB2sllzwu1rPcw-1
X-Mimecast-MFC-AGG-ID: 7HLrK8LpMB2sllzwu1rPcw_1743115325
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5E7FC19560B1
	for <llvm@lists.linux.dev>; Thu, 27 Mar 2025 22:42:05 +0000 (UTC)
Received: from [172.20.32.163] (unknown [10.30.44.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0846C19541A5;
	Thu, 27 Mar 2025 22:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 5c2a430e)
Date: Thu, 27 Mar 2025 22:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <91994.125032718420600183@us-mta-120.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uNUDW1c3nCnvUHq10yUrrkvoRZbBCGMIBZNzBxMtKUs_1743115325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'ext4-for_linus-6.15-rc1' of git://git.kernel=
.org/pub/scm/linux/kernel/git/tytso/ext4

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1739128775

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1739128775-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1739128775-x86_64-kernel
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

