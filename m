Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9483A2505D3
	for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740163943; cv=none; b=e02UYXQ10ItgQZ/qLAWD5IdICP2VL/MCRQzxwTTS4/8nffeLWewzukvtw2jl7M1Jm+IJ9VqdCR6gh8WPgVrK7hz60GKnNzHoIyXJ4JktcmKBnB9XbSNNiVCHqIZP5QgIRoDgPt7Kt/Qy4ql17ihPtd4pXnFsHvQRdhG/WsTY7yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740163943; c=relaxed/simple;
	bh=uIZkpD7fbwhoKtYLg+ysmUCPbmkJAF31zUPou/vc+dY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=rVXNf+cYroN6qtdbbKl0R0eGWvk69YEfqxEHupTxklzW3q0V1kKnZorfo1fqTuH4D8E+Iz6CoGS1kFxnFWHZFVRUL17VIPo6V56CWPqiq2PV214dHjzWfdH9O8n8TL3av1snofHbv+jYKXgIXHj5P1x4sB36hovdKfLn9J4mpkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AHCeLsQD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AHCeLsQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740163929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=umPLv6wAT37+G00vl3IT9Dy4mC7IyP9yVwmIqfa1dfY=;
	b=AHCeLsQDX0NGYlo/NlK4CARp6mZzjnOHHl3QJbun6CMB6n5txGaVYj5LKTZ7c8gfEdCdkg
	a6t6mZz43b2ELJj786hx5BB7KpjHHa4Trt20vGwcas16ZOYUery4hAMvIpgNGBssfA8gXX
	LxYTv+sjVX1TxO7s+kQZ1GVlnm5DpSw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646-GkCj-CohNoeRsWVXH8r-gQ-1; Fri,
 21 Feb 2025 13:52:08 -0500
X-MC-Unique: GkCj-CohNoeRsWVXH8r-gQ-1
X-Mimecast-MFC-AGG-ID: GkCj-CohNoeRsWVXH8r-gQ_1740163927
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3C0C31800873
	for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 18:52:07 +0000 (UTC)
Received: from [172.64.3.45] (unknown [10.30.32.189])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C1E6B180087E;
	Fri, 21 Feb 2025 18:52:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc3,
 upstream-mainline, 8a61cb6e)
Date: Fri, 21 Feb 2025 18:52:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <51150.125022113520801061@us-mta-646.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yZBwbxBVEzB-3NkPIr1YxtM8DoDTB4nH8EPy-NK9-Fg_1740163927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'block-6.14-20250221' of git://git.kernel.dk/=
linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1682942193

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1682942193-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1682942193-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1682942193-x86_64-kernel
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

