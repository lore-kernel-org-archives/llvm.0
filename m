Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13985F9D6
	for <llvm@lists.linux.dev>; Sun,  2 Mar 2025 13:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740923530; cv=none; b=AVEU58exFpscvYxP6CvLQr9FQZukIE9njujKM96JpDo3rOxy92aBr2bQM2iowg6QdhLrKBdxmzTMPxCTE2MDErCX5vtGEvpuDkWVjLeIbSnHtAVQtxoEoLWSfYib8l5MjB/c56npN42HrT5hEFa8x/cXnVoIYxYMZYbpuAhM1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740923530; c=relaxed/simple;
	bh=qWpDFwfXjwPTYjvheVkM38RUkg4lvsZuE8urd9EAJzk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UoDSFb//IElWYlqdbJQC3wzBsTYZpUYPag+5qUp/+jU9fhsvZYkCd34SlyUCRQr7/xF4rITYPH7WOsv0pHOmknmoX1sik3byJlQqS4E6XujAYPnj9S5IYV78dL0vA0X4vaGL/3MkzmHK+ZJHluqOVsQAugr8WdqbgC4maLSpkPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ix2XApz9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ix2XApz9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740923527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/rQWER10ixQ33FvqtmzXHog2QO5lnetzX5WeVUHD/M8=;
	b=ix2XApz9i8d0iansq4F7Nx1B+d/i1nHd6PSv85qcJlqHp1whFjyJpFwXb5vvmaYGmPcLCF
	a356UyJJLxlYz5Enk57WCzd4Ow5pYifYSJYmV4fFUROXdc/jSvT3knkujQY7uAmu561S8k
	dcnyMeYfKU5CxVT9c9T0Wig2/kVjwkc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-_dI2RpOuMmih7kThw0jDQA-1; Sun,
 02 Mar 2025 08:52:06 -0500
X-MC-Unique: _dI2RpOuMmih7kThw0jDQA-1
X-Mimecast-MFC-AGG-ID: _dI2RpOuMmih7kThw0jDQA_1740923526
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C88791800877
	for <llvm@lists.linux.dev>; Sun,  2 Mar 2025 13:52:05 +0000 (UTC)
Received: from [172.64.10.27] (unknown [10.30.34.106])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 572631956048;
	Sun,  2 Mar 2025 13:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc4,
 upstream-mainline, 1973160c)
Date: Sun, 02 Mar 2025 13:52:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <32112.125030208520600599@us-mta-265.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5wqOE2P963tJ6AkR61U19jxBC_jLKdGSb9vKm1mXVMg_1740923526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'gpio-fixes-for-v6.14-rc5' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/brgl/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1695355329

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1695355329-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1695355329-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1695355329-x86_64-kernel
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

