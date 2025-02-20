Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2B01C6FF0
	for <llvm@lists.linux.dev>; Thu, 20 Feb 2025 03:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740023531; cv=none; b=SsNJ0KGTF/LnnoH87F66GkvbLElymskVJvilz2KV/QzYX0KpqVnsMzLiWULdqFVoCKuURi40VQrmKorq9ZGPYEe5e+UJha3Ugdcvh7Xh6bMZErJ0SjAoQ9ufRJ1E/bzT1lw9p7Replex046LUC7lcZMuyHva+ISnfrlcP70hIZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740023531; c=relaxed/simple;
	bh=S0DECgsvmBkt3LqGoE0M+pYQG//GSUf+JrRrmdsd3Sw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=qcPPvMZRrg34sbOZqKMgYqEDrm76BMkDePTRHk5epozLePFfsty/GlnQp6uGKD991e3KNzawcuGvkmhC/tS9bTFo8z9pghZyOMfUHsdoeytdsIIyUd6RBGgl6q58nKcqT536krMxAMcyd8luQ7gh+iQGdSr4K0Dxj/By+mZFSDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GwXX17xr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GwXX17xr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740023528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CN82ABXfD0klHDG+mpz0mgfOrUXmJsTDvCzAwMA+kp4=;
	b=GwXX17xrUiHXEyyKseM/ktNw5TfyEyxL/vWAEG4NbwG+lt7199Fkdop6lsBzulIW4SEQp6
	g6maGt6vPplVrM8NdIMf4nAJHoXci2vHqcVaZrHu2RU1RujldusK96yFqjgLf5nQCgxnNn
	PIY/jiN9wLnNSO7k1fQbpBmYUL304kw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-zto2yl7LMhORO-XS1wkeug-1; Wed,
 19 Feb 2025 22:52:07 -0500
X-MC-Unique: zto2yl7LMhORO-XS1wkeug-1
X-Mimecast-MFC-AGG-ID: zto2yl7LMhORO-XS1wkeug_1740023526
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4FE3019373DC
	for <llvm@lists.linux.dev>; Thu, 20 Feb 2025 03:52:06 +0000 (UTC)
Received: from [172.64.12.28] (unknown [10.30.33.24])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B280F1955BCB;
	Thu, 20 Feb 2025 03:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc3,
 upstream-mainline, 87a132e7)
Date: Thu, 20 Feb 2025 03:52:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <25667.125021922520700514@us-mta-644.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CNMGDLmifgUmBUC6aFCIHkdXvovfgGyCo_HZJc45md4_1740023526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'mm-hotfixes-stable-2025-02-19-17-49' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1679661118

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1679661118-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1679661118-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1679661118-x86_64-kernel
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

