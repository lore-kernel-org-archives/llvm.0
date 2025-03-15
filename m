Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9B3194091
	for <llvm@lists.linux.dev>; Sat, 15 Mar 2025 06:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742020390; cv=none; b=C4gUTQaoLdC6+33Yqq6yKjBMrGFYshhNmcSEUKNWvB+kPpcU6ZqV8Xg8O1A5mV82RQPPGhv/fGTaIpcf3MCPYttPljmB9J+FnJd0CREKK+0EFIFrzY0N9lYoNj9YMZNuYDrahlJOSL6lEv2XUSHk1BUS8yVlmnEASdiN55hXPWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742020390; c=relaxed/simple;
	bh=/mYfy5vigFe68jPMXpeMp22ITgCtYpuyHnKQhoU4DKw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=DfaYFrWu4RsOCaq8+61hJjcBtukXXU+s8Q7vKs/d96v+8wX3Sj4HppHb7q5qzP8npgUuyiUb8+V6qk89EnNiGLjHt5bkkYGeNF9TlqjnmT6vXvSBWXgEi43tl56XYD3jwracwYX/+CYXC5UMTCIenyh56zyadbboO6SmxzkHePQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c0oGqLJP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c0oGqLJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742020387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gn9ZkvIMq3uIyFoJ80VVU7Xfjaqyfzrf8Ui86i6IXWU=;
	b=c0oGqLJPAz+64XX06uyq37nPH4omlkWZQu2cr3Jpe/OqjL8ns13M7O6WPicjX3EyqlS51U
	o4TpYnJ7kaZotVc0NS9tFYClNKWXC8YBE3GIS1E7uA4ndCMnzCkdQ3LmJ1t2mWBZCNapFt
	HueGx3ciU6cgWGSv2DFcwQFFCv5oOcg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-536-eHWfFOuSMzGDp6Vo3TclxA-1; Sat,
 15 Mar 2025 02:33:05 -0400
X-MC-Unique: eHWfFOuSMzGDp6Vo3TclxA-1
X-Mimecast-MFC-AGG-ID: eHWfFOuSMzGDp6Vo3TclxA_1742020384
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 920F918007E1
	for <llvm@lists.linux.dev>; Sat, 15 Mar 2025 06:33:04 +0000 (UTC)
Received: from [172.64.0.42] (unknown [10.30.32.80])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1F9321955F2D;
	Sat, 15 Mar 2025 06:33:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc6,
 upstream-mainline, 3571e8b0)
Date: Sat, 15 Mar 2025 06:33:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <13914.125031502330500102@us-mta-536.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l-BOCLOXSBJDCmyaH9aE-EDitRFYkgIjF1Yi-WBXy_A_1742020384
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'v6.14-rc6-smb3-server-fixes' of git://git.sa=
mba.org/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1718042493

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1718042493-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1718042493-x86_64-kernel
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

