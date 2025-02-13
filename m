Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E908728A2BF
	for <llvm@lists.linux.dev>; Thu, 13 Feb 2025 22:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739485989; cv=none; b=YS0FuMvMYHptkwJOVRk0/kXHwhTvSG4MKqiFPXP3gDuBp4YpjvWhz280TgY+ENVOF5FYERy12NA9eaDt6a77S2b8KbuaAYPBoH0G85bN1ye0S+Wk6bQNRa3zTrtQ6J0CrbpnZUaXUSkpIABpyYwzV6u6gLXaJoOkGntA6wbr/9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739485989; c=relaxed/simple;
	bh=jT+OrOQJPppm8Q/54VHsqyzrgwdUhZYzqjKucDJejBY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ARXsg4J+j+VPJ+K6cgYmr1upZMgHa3f46oW0lEfUhpmejN0dz7QOsD2MhTe5TTL4FAVW/ibOCFC/9UBVVFSwpfMlAlCdiLm1r68wqM4rlr/hahYojeFMcHJ06mJiOYPEqlR1GwcpzfAeqmKS5xBfvmap4SxAxbSP11H0/gDOPrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DkCP7Ye0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DkCP7Ye0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739485986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AfQOzXsSYFQF4cQigHXyj/xPwXxjIdNs7jEXhHeZC+8=;
	b=DkCP7Ye0lr8VaDN8cUDF6W4WuiztnQZwz6alP2vWE25H4rHcUZAgHjOpUYcdV63KPICTcm
	UBhH+hO7gELUksDhDfmVfpMfCeGficLyWJuXuG/C5SUvT2+4D6lQLYb8kzAf25pqOewHrT
	9Fvo/anv1ZjZNyN1FJjguSqtur4XQI8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-sGBA33FtOPisxSSlH1wGzw-1; Thu,
 13 Feb 2025 17:33:05 -0500
X-MC-Unique: sGBA33FtOPisxSSlH1wGzw-1
X-Mimecast-MFC-AGG-ID: sGBA33FtOPisxSSlH1wGzw_1739485984
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3930F19373DC
	for <llvm@lists.linux.dev>; Thu, 13 Feb 2025 22:33:04 +0000 (UTC)
Received: from [172.64.13.25] (unknown [10.30.32.164])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D5239180035E;
	Thu, 13 Feb 2025 22:33:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc2,
 upstream-mainline, 68763b29)
Date: Thu, 13 Feb 2025 22:33:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <55167.125021317330500231@us-mta-213.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2jH5AE7_dogCRmf9G8mLDP5IH5ANnTw_IQpTgOyAMVc_1739485984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'spi-fix-v6.14-rc2' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/broonie/spi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1670414293

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1670414293-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1670414293-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1670414293-x86_64-kernel
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

