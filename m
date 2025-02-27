Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCFE188006
	for <llvm@lists.linux.dev>; Thu, 27 Feb 2025 04:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740630188; cv=none; b=bY4MuNv+dc2cXs4Bki6vaHq0J+KL5mhEYsI7O1MLtD92GblLLKN51xbTZEPZrRTeuCtV/tuZENPAWwQFPltuuSu5AdmOWNyZhIXP7t5n7/Z6i7fnvr/B5DnOk+c4AHID3qZfg/n78aGZZninTnnTBNap81xPGRMjGTPT47HF2rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740630188; c=relaxed/simple;
	bh=tDvfm+OpTrP+qKHJxWbthB/k3LqlR4DDk1tN09qQy4Y=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=PyL2fCsrqKjjzA1U3SmkQv6Gil+BPJnk7dW8EZXnbUvODbRQqZbScxczPjlXUuzcxoRrsLVjikJpW4h7knzF6p0+77Y0X0qCV85zSC6xvDM9Y3ACzpeflILMnAcuFeE6qLbfvUrQ+v0UKtDY0VhPEZwqv7bLpKtI2iQ5zFiwhPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hOGjA2Nc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hOGjA2Nc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740630184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c6VV6UdcOWWkhNrcmDdOO1LBGsBqKkgrazo2A1GKEFU=;
	b=hOGjA2Ncdmn3JLPdX5lUPe5THXTT3Y5hLgR1hsjxHK4BCQB3sf78tNSFst/Lr7/Yt1KXlV
	DGOv/2dOOwmfuttd8RKkmcssdjTJV7KeWt/Zn0iT+gQFAucJ+Wx7zDMcdDZa52EWp/upjp
	M1gGKTQxikxLY9QpNoH6KI79UThBxWM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-448-rNu4R2Q_M2iKQwHgkLAXOg-1; Wed,
 26 Feb 2025 23:23:03 -0500
X-MC-Unique: rNu4R2Q_M2iKQwHgkLAXOg-1
X-Mimecast-MFC-AGG-ID: rNu4R2Q_M2iKQwHgkLAXOg_1740630182
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F3C71975AFC
	for <llvm@lists.linux.dev>; Thu, 27 Feb 2025 04:23:02 +0000 (UTC)
Received: from [172.64.13.23] (unknown [10.30.32.164])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1F9E41800367;
	Thu, 27 Feb 2025 04:23:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc4,
 upstream-mainline, dd83757f)
Date: Thu, 27 Feb 2025 04:23:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <51168.125022623230300503@us-mta-448.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LiTc4JYP9YwvKwOP9omI6_dbPcCUa2huhQB18LEYfbk_1740630182
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'bcachefs-2025-02-26' of git://evilpiepirate.=
org/bcachefs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1690754700

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1690754700-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1690754700-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1690754700-x86_64-kernel
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

