Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A7414F102
	for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 20:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738267331; cv=none; b=MW0KwTI817L6RpOXPipmQMh3eqaJr3TAsktzQ5qopb+utFYR3Us9StSkgucHCsOSkJwfPBTE5zsDdf5RQqOWTzMH2dNhEhoSIUYIscmvm9wp0XtyUUqRDVSyVUav13JL1ULZKNXqiL6ctWJzOrwY4eUtY5ek6lmWllpDQ4WW1qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738267331; c=relaxed/simple;
	bh=S2J5TQ/hYbf2zckEWu8FvQv14hMvt9w6sBPfRUgXJMM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=NBK+fYk3GnMOvZLyIpsTAa9ygXoGup6fUs/hbeIlAF1yd5HtEv8QQJcPQ43eKPuph15UyEvTK15GOldInOJcrvx19GUU4tUCIWGZGEqntEoaw565Gd71YUtmAoy/0DoNBZ1BPnhNhtnIm+tqEX0ZNxYbCAtarp9E+OEwVd+IS7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ateKbRnU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ateKbRnU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738267328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/778j+oNC3ntVme+7nL+hUCgEe0Mbtld86zlyfLTp9c=;
	b=ateKbRnUF7TSNYESoty3MK+1R9u1+hk/i5pOeDJ9rFS6SofglBYZ0NUPFQ+uI74xNMZHCT
	B/DYzZ0g64/JzWtS3F0Dh0EG7Wg0dEhV7uQ9VXxRxZZi3WLP3lalOewMXR1Oz1QxqLz/sG
	a6SB6l+usW/B3OJxbF1S/8oZqRZ86XY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-315-_BM5hZ7uPtGPQuV9rsyhpg-1; Thu,
 30 Jan 2025 15:02:07 -0500
X-MC-Unique: _BM5hZ7uPtGPQuV9rsyhpg-1
X-Mimecast-MFC-AGG-ID: _BM5hZ7uPtGPQuV9rsyhpg
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4DE6B1801F18
	for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 20:02:06 +0000 (UTC)
Received: from [172.64.3.40] (unknown [10.30.32.189])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EB9611800905;
	Thu, 30 Jan 2025 20:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, b8a1c9f4)
Date: Thu, 30 Jan 2025 20:02:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <63988.125013015020700321@us-mta-315.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aX2s0_cVgZouWgL3arta8L1mquCDI-_8-z96w7iQqdE_1738267326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 's390-6.14-3' of git://git.kernel.org/pub/scm=
/linux/kernel/git/s390/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1649096116

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1649096116-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1649096116-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1649096116-x86_64-kernel
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

