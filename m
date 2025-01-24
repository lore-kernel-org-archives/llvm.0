Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04A01E7C04
	for <llvm@lists.linux.dev>; Fri, 24 Jan 2025 22:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737758587; cv=none; b=JE1b9JFg1cml58X2qZoNwZgGh4ZmuaBNIoiKL7xg3/2Ac0hLjd5v5JypmyEol42cOUH2EHM/8VTuDUNAI6hAe3+iT78cyUZTgi0RzY9flqVnYSQmuoxPCUf6aY278QZ0ePVBr4bXLyBln6ZemuDQpkbOx+ySOJn23/lqeBojGbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737758587; c=relaxed/simple;
	bh=rnQWMRTK9cS38+2je246VXcJRS614kXI4yAiDyuSQkU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=SRSVBV/l7eB56jdFWRCsEzfaPD2GeVaZZFM17YBGpx0WyVNAHPU5mOPY2qAeWdQEfLzgNAHL8MWwqZ6APptP1z8RsoVz/zog9CQG0gX/0K1c53bghYFnKOM8WSLn/MpRn7cUiC4FrFe1YHr/aexgS6v9O8lkNdtY+08pgXeNcgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cXvKnrJB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cXvKnrJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737758584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=35Uo23Uz3oRdNS+aOkZbZyXhyr3g8ld+czV1dWL1K2k=;
	b=cXvKnrJBbsXD9gHk6SmML7XSJM3OWCmo0FwyRn4VNkh8MvzgBvABo8Emy+8kp6/cn96IvO
	pz9NAlsbWloNS567qJM5kBq9WOG7s7zBfNJkUx+nPBvh9oSsJw9zrLHlffrMGB7EHh+PHQ
	lu8syc3Wd7ZcpbEUbiZq2SWZ0JwJ3pg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-xvLuWtSkMoigWn-1Rpvvbw-1; Fri,
 24 Jan 2025 17:43:03 -0500
X-MC-Unique: xvLuWtSkMoigWn-1Rpvvbw-1
X-Mimecast-MFC-AGG-ID: xvLuWtSkMoigWn-1Rpvvbw
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 280D51800370
	for <llvm@lists.linux.dev>; Fri, 24 Jan 2025 22:43:02 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AB46D1800344;
	Fri, 24 Jan 2025 22:43:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, 0afd2209)
Date: Fri, 24 Jan 2025 22:43:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <74418.125012417430300485@us-mta-226.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CbwgXw9k5wo3oK-Xu96MP8Gf0aaOCIxJGRJGWGueRUs_1737758582
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/rdma/rdma

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1640316394

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1640316394-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1640316394-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1640316394-x86_64-kernel
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

