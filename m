Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213BD1DA3D
	for <llvm@lists.linux.dev>; Mon, 30 Sep 2024 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727703196; cv=none; b=IKJeo1yFLFJPvFXpY0Gmxg66sm/3rRxAukgJ0RADcavvOVOTG2oi+TrrRMUwB1HgIgcAxSDG2ut8zrDDzfXcwF+5++wi5m5FahtGcCjyy4e0EpRWMFM/B29SCjIRqOpR7OilZzKq+k45J81wGjMP0uIHooAgHVNwajLF8kpjQgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727703196; c=relaxed/simple;
	bh=cbIvDTVxJCkY3/rHsjbh2KBUL5nZ36/yo7yfLuH8OxM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=XoW9bBJNEZRlgjx0owky3LfjNh/TfSfZAWNhuPtTYtdKUGuFgkjvG2QPjlrtxGluDAU97ePU7SvwKbnnTPPQytm5JFLjKyCv+KzpVfq/hQWUpaE6cjI0Kbc/0A/44hy/J5VctpFy5koBjfiXDeVIUTEVnA0pfb0Hs0yL0Ssxjv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gwS6UXEn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gwS6UXEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727703193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3DI7jv8xA3/Kwp/JaTMaaBfD5T0dsv1JRjYtD9TSGCc=;
	b=gwS6UXEnj0ve9baFIs6b3mydDSnBGkHBiUB/3JE2VDg5zfUUTa9RqZyV9j3gksUxkqw+Bb
	KH9GsJFMvdStJ1m0FlwKuFc/F2VZJxAx5wGvrcaJSuUmOvOuLwsHMPPxH7Po0TKXRsTcHE
	9WYExsqFCKJLvwLZbg98xCtSSYYkHck=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-224-8l2e9D35PrGN9IavZ0VV5A-1; Mon,
 30 Sep 2024 09:33:10 -0400
X-MC-Unique: 8l2e9D35PrGN9IavZ0VV5A-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C367A18C0B08
	for <llvm@lists.linux.dev>; Mon, 30 Sep 2024 13:33:08 +0000 (UTC)
Received: from [172.64.3.33] (unknown [10.30.33.101])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4FFC4195E770;
	Mon, 30 Sep 2024 13:33:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, e7ed3436)
Date: Mon, 30 Sep 2024 13:33:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <95455.124093009331000597@us-mta-224.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'mailbox-v6.12' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/jassibrar/mailbox

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1474261764

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1474261764-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1474261764-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1474261764-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1474261764-x86_64-kernel-debug


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

