Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165772A8D0
	for <llvm@lists.linux.dev>; Sun, 22 Dec 2024 18:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734891732; cv=none; b=ifL3QI2ckMJQmppNK6n06adMPPXqIN9Chwx91zC9vyi37rS+jcjxSOTR5Dg+o3QbxoqCpHal3uin9aGly9pCU7Rl9wmmkaHwwdk8CtAGpU3yJ6Vm6ZCVRAKUKlRoq5eh9mlOSVP/vnzqBi+RAm0x8ALmLSISVNqFykkG2ER4qRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734891732; c=relaxed/simple;
	bh=jGzb/PinZ/xe3t/oPfr2lduhcJ7uNp6ryCjai6qdrLE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=n3uuythagX16SGAnh8C0aH6uncaqmOwpjeIB91uLjYjzkqrmWtWc/56Jc/5sALxochNJVTlUCvdMuR5iYZ4DETyR4kTsDEjDP5p14xFFeqqV9OBpeY+qnnTZmT0E6OqDn+1VJynTYumUA3pURrUux3K7IuolHJ11IEknyolk1CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FnmGJbSs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FnmGJbSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734891728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oopt72xgfLLhag5smkKtR7ehSqgHOInJvOwES0zXe9A=;
	b=FnmGJbSsEofLrgRUsx42DBGkuBgbeCGJtSbjPywSvxy3EdY1l/7nUSCRsf2ou6UNkSF9Rg
	m5dySmLdkeFHD/ssKemWEp0bU/Tr31vOt1cNP2lnFUPIdlQZH4mz9R1o07L7yhkEMVp5RD
	9gBxZwm/oDaVMoKZNOHV+Oa+JxuCmfQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-99-g93SP9OhMhuBholeI_4mbQ-1; Sun,
 22 Dec 2024 13:22:07 -0500
X-MC-Unique: g93SP9OhMhuBholeI_4mbQ-1
X-Mimecast-MFC-AGG-ID: g93SP9OhMhuBholeI_4mbQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 86CCC19560BD
	for <llvm@lists.linux.dev>; Sun, 22 Dec 2024 18:22:06 +0000 (UTC)
Received: from [172.64.13.20] (unknown [10.30.32.164])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4F6EA1956086;
	Sun, 22 Dec 2024 18:22:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc3,
 upstream-mainline, bcde95ce)
Date: Sun, 22 Dec 2024 18:22:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <98207.124122213220701161@us-mta-99.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 13wSkXNb559k6VrR1WoaAj2SpHEtu2ydXtTuVaPnZEw_1734891726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'devicetree-fixes-for-6.13-1' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/robh/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1599598994

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1599598994-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1599598994-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1599598994-x86_64-kernel
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

