Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B698B18C004
	for <llvm@lists.linux.dev>; Tue, 28 Jan 2025 18:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738088289; cv=none; b=O+xwM3jn5JV0NnqC4f4IZvNmmRZ0wZDvKrBmFA3fSHvKZycRzbwgpfZNwdqvlMaZrgTMMGV/RjCPR37TJm1ZJUoom9eysrHVaoMCivwrM5go5dkOwspp8Muajd+wX49+7ybA6q1Ylyb873Q0akEE+KA3BhAKNwT+3HPUoYLVG9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738088289; c=relaxed/simple;
	bh=5ER2d9p3jsoggZ1pm9yJoIAhdy7sdAnLR+1lxGxhU/I=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=aqzXgYdMYN8GKwDDg0I2tzlr+pWgHVK8ZLfouUJ0MLxddDOff7UY6xZoTc+IzUPEbK4cB8dFSbijcmyg78VDIqcWoqiM+zoMTJnreyrvQk9va1XEdYd5Ohxc7WDoIsicQ9JiO20EWTN3a4YmFbw3bnPxFI1buwYudhzTVkl1ynU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AjM6m0TH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AjM6m0TH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738088286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YFh0jXqNKvlbmFSDHbd/Vl91J192JwZsfUkkIOjB3AE=;
	b=AjM6m0THyrknAZUJT7+7qNUXleDMCkcuanyuP7LgRaznOsZcoa8GX46/2CE+nwvyYG4/zd
	63CTRS5Hj5wvQtvsmhEW0qPOFWuoYEw1WJhVACXq1lcX068lqu53CspPI+VkG7sgv3OLsX
	tHau+I5fRlbXY34HgWzUkK7duXqOzk4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-843iXi7_NP6-mCOPQOs4KA-1; Tue,
 28 Jan 2025 13:18:05 -0500
X-MC-Unique: 843iXi7_NP6-mCOPQOs4KA-1
X-Mimecast-MFC-AGG-ID: 843iXi7_NP6-mCOPQOs4KA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F07C1800269
	for <llvm@lists.linux.dev>; Tue, 28 Jan 2025 18:18:04 +0000 (UTC)
Received: from [172.64.3.40] (unknown [10.30.32.189])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B0DA5195608E;
	Tue, 28 Jan 2025 18:18:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, e2ee2e9b)
Date: Tue, 28 Jan 2025 18:18:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <95396.125012813180500711@us-mta-614.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sLvd75eLN5lXaOwCLvToIX5C9p4PH9rEB2um2h8EX_8_1738088284
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'arm64-upstream' of git://git.kernel.org/pub/=
scm/linux/kernel/git/arm64/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1645354831

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1645354831-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1645354831-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1645354831-x86_64-kernel
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

